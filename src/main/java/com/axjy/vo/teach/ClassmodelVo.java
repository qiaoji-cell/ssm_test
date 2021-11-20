package com.axjy.vo.teach;

import lombok.Data;

@Data
public class ClassmodelVo {
    private String gName;//班级名称
    private String gradeName;//所属课程
    private String remark;//备注
    private Long gardenId; //所属园所

}
