package com.example.hotel.controller.admin;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.hotel.controller.common.BaseController;
import com.example.hotel.dto.JsonResult;
import com.example.hotel.dto.QueryCondition;
import com.example.hotel.entity.Clean;
import com.example.hotel.entity.Role;
import com.example.hotel.entity.User;
import com.example.hotel.service.CleanService;
import com.example.hotel.service.RoleService;
import com.example.hotel.util.PageUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * <pre>
 *     打扫管理控制器
 * </pre>
 */
@Slf4j
@Controller
@RequestMapping(value = "/admin/clean")
public class CleanController extends BaseController {

    @Autowired
    private CleanService cleanService;

    @Autowired
    private RoleService roleService;


    /**
     * 查询所有清除记录并渲染Clean页面
     *
     * @return 模板路径admin/admin_clean
     */
    @GetMapping
    public String cleanList(@RequestParam(value = "status", defaultValue = "-1") Integer status,
                            @RequestParam(value = "page", defaultValue = "0") Integer pageNumber,
                            @RequestParam(value = "size", defaultValue = "10") Integer pageSize,
                            @RequestParam(value = "sort", defaultValue = "createTime") String sort,
                            @RequestParam(value = "order", defaultValue = "asc") String order, Model model) {
        Page page = PageUtil.initMpPage(pageNumber, pageSize, sort, order);
        QueryCondition queryCondition = new QueryCondition();
        Clean clean = new Clean();
        clean.setStatus(status);
        queryCondition.setData(clean);
        Page<Clean> CleanPage = cleanService.findAll(page, queryCondition);
        model.addAttribute("cleanList", CleanPage.getRecords());
        model.addAttribute("pageInfo", PageUtil.convertPageVo(page));
        model.addAttribute("status", status);

        User user = getLoginUser();
        Role currentRole = roleService.findByUserId(user.getId());
        model.addAttribute("currentRole", currentRole);
        return "admin/admin_clean";
    }

    /**
     * 新增/修改清除记录目录
     *
     * @param clean
     * @return 重定向到/admin/Clean
     */
    @PostMapping(value = "/save")
    @ResponseBody
    public JsonResult saveClean(@ModelAttribute Clean clean) {
        cleanService.insertOrUpdate(clean);
        return JsonResult.success("保存成功");
    }

    /**
     * 删除清除记录
     *
     * @param cateId 清除记录Id
     * @return JsonResult
     */
    @DeleteMapping(value = "/delete")
    @ResponseBody
    public JsonResult delete(@RequestParam("id") Long cateId) {

        cleanService.delete(cateId);
        return JsonResult.success("删除成功");
    }


    /**
     * 开始打扫
     *
     * @param id 清除记录Id
     * @return JsonResult
     */
    @PostMapping(value = "/start")
    @ResponseBody
    public JsonResult start(@RequestParam("id") Long id) {
        User user = getLoginUser();
        Clean clean = cleanService.get(id);
        if (clean == null) {
            return JsonResult.error("数据不存在");
        }
        clean.setStatus(1);
        clean.setStartTime(new Date());
        clean.setUpdateBy(user.getUserDisplayName());
        cleanService.update(clean);
        return JsonResult.success("开始打扫成功");
    }

    /**
     * 完成打扫
     *
     * @param id 清除记录Id
     * @return JsonResult
     */
    @PostMapping(value = "/finish")
    @ResponseBody
    public JsonResult finish(@RequestParam("id") Long id) {
        User user = getLoginUser();
        Clean clean = cleanService.get(id);
        if (clean == null) {
            return JsonResult.error("数据不存在");
        }
        clean.setStatus(2);
        clean.setFinishTime(new Date());
        clean.setUpdateBy(user.getUserDisplayName());
        cleanService.update(clean);
        return JsonResult.success("完成打扫成功");
    }


}
