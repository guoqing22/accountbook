package com.welab.bill.controller;

import com.welab.bill.pojo.Tbbill;
import com.welab.bill.pojo.Tbdeposittype;
import com.welab.bill.pojo.Tbdrawtype;
import com.welab.bill.service.ITypeService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @package: com.welab.bill.controller
 * @author: qing
 * @date: 2017/12/31
 * @time: 23:29
 **/
@RequestMapping("/type")
public class TypeController {
@Resource
private ITypeService typeService;

    @RequestMapping("/selecttype")
    @ResponseBody
    public Map<String,Object> selectType(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        List<Tbdeposittype> deposittype = typeService.listDepositType();
        List<Tbdrawtype> drawtype = typeService.listDrawType();
        map.put("deposittype",deposittype);
        map.put("drawtype",drawtype);
        map.put("data",map);
        return map;
    }

}
