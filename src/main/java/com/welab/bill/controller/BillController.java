package com.welab.bill.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.service.IBillService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @package: com.welab.bill.controller
 * @author: qing
 * @date: 2017/12/17
 * @time: 9:41
 **/
@Controller
@RequestMapping("/bill")
public class BillController {
    @Resource
    private IBillService billService;
    private HttpServletRequest request;
    private Model model;

    @RequestMapping("/selectbill")
    @ResponseBody
    public List<Tbbill> selectByBillDate(@RequestBody Map<String, String> myDate,
                                         HttpServletRequest request) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date start_date = dateFormat.parse(myDate.get("start_date"));
        Date end_date = dateFormat.parse(myDate.get("end_date"));
        PageHelper.startPage(1, 10);
        List<Tbbill> bill = billService.selectBill(start_date, end_date);
        PageInfo page = new PageInfo(bill);
        System.out.println(page.getTotal());
        System.out.println(page.getPageNum());
        System.out.println(page.getPageSize());
        return bill;
    }

    @RequestMapping("/deletebill")
    @ResponseBody
    public Map<String, String> deleteByBillId(@RequestBody Map<String, String> billid, HttpServletRequest request) {
        String id = billid.get("billid");
        Map<String, String> map = new HashMap<>();
        if (billService.delectBill(id)) {
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }

    public Map<String,String> insertBill(@RequestBody Tbbill bill,HttpServletRequest request){
        Map<String,String> map = new HashMap<>();
        if(billService.insertBill(bill)){
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }
}
