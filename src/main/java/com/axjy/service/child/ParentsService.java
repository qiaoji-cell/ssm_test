package com.axjy.service.child;

import com.axjy.pojo.child.Parents;

public interface ParentsService {
    Parents find(String studentCode);
    int  insert(Parents parents);
    int delete(String studentCode);
    int update(Parents parents);
}
