package com.axjy.pojo.sys;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * kms_user_garden
 * @author 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserGarden implements Serializable {
    /**
     * 用户id 引用用户
     */
    private Long userId;

    private Long[] userIds;

    /**
     * 园所id 引用园所
     */
    private Long gardenId;

    private static final long serialVersionUID = 1L;
}