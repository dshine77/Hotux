package com.example.hotel.entity;

import com.example.hotel.common.base.BaseEntity;
import lombok.Data;

import java.util.Date;

/**
 * 打扫房间记录
 *
 * @author dai
 * @date 2021/1/26 11:56 下午
 */
@Data
public class Clean extends BaseEntity {

    /**
     * 客房标题
     */
    private String postTitle;

    /**
     * 0 待打扫
     * 1 正在打扫
     * 2 已完成
     */
    private Integer status;

    /**
     * 房间编号
     */
    private String number;

    /**
     * 开始时间
     */
    private Date startTime;

    /**
     * 打扫时间
     */
    private Date finishTime;
}
