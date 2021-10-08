package com.example.hotel.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.example.hotel.entity.Clean;
import com.example.hotel.mapper.CleanMapper;
import com.example.hotel.mapper.PostMapper;
import com.example.hotel.service.CleanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <pre>
 *     打扫记录业务逻辑实现类
 * </pre>
 */
@Service
public class CleanServiceImpl implements CleanService {

    @Autowired
    private CleanMapper cleanMapper;

    @Override
    public BaseMapper<Clean> getRepository() {
        return cleanMapper;
    }

    @Override
    public QueryWrapper<Clean> getQueryWrapper(Clean clean) {
        //对指定字段查询
        QueryWrapper<Clean> queryWrapper = new QueryWrapper<>();
        if (clean != null) {
            if (clean.getStatus() != null && clean.getStatus() != -1) {
                queryWrapper.eq("status", clean.getStatus());
            }
        }
        return queryWrapper;
    }


}
