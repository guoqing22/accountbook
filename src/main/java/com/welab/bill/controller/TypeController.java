package com.welab.bill.controller;

import com.welab.bill.pojo.Tbbill;
import com.welab.bill.pojo.Tbdeposittype;
import com.welab.bill.pojo.Tbdrawtype;
import com.welab.bill.service.ITypeService;
import org.springframework.stereotype.Controller;
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
@Controller
@RequestMapping("/type")
public class TypeController {
@Resource
private ITypeService typeService;

    /**
     * 获得支出去向分类
     * @param request
     * @return
     */
    @RequestMapping("/getdeposittype")
    @ResponseBody
    public Map<String,Object> getDepositType(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        List<Tbdeposittype> deposittype = typeService.listDepositType();
        map.put("deposittype",deposittype);
        return map;
    }

    /**
     * 获得收入来源分类
     * @param request
     * @return
     */
    @RequestMapping("/getdrawtype")
    @ResponseBody
    public Map<String,Object> getDrawType(HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        List<Tbdrawtype> drawtype = typeService.listDrawType();
        map.put("drawtype",drawtype);
        return map;
    }

}
