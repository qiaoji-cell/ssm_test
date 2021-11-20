package com.axjy.vo.teach;

import lombok.Data;

@Data
public class ClassroomVo {
    private Integer lessNum;//最少人数
    private Integer manyNum;//最多人数
    private Integer roomState;//状态
    private Long gardenId; //所属园所
}
