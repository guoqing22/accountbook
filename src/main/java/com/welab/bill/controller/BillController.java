package com.welab.bill.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.pojo.Tbuser;
import com.welab.bill.service.IBillService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.util.calendar.BaseCalendar;

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
    public Map<String,Object> selectByBillDate(@Param("start_date") String start_date,@Param("end_date") String end_date,
                                         HttpServletRequest request) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(start_date);
        System.out.println(end_date);
        Date start = dateFormat.parse(start_date);
        Date end = dateFormat.parse(end_date);
        List<Tbbill> bill = billService.selectBill(start,end);
        Map<String,Object> map = new HashMap<>();
        map.put("data",bill);
        return map;
    }

    @RequestMapping("/deletebill")
    @ResponseBody
    public Map<String, String> deleteByBillId(@RequestBody Tbbill bill, HttpServletRequest request) {
        String billid = bill.getBillid();
        System.out.println(billid);
        Map<String, String> map = new HashMap<>();
        if (billService.deleteBill(billid)) {
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }
    @RequestMapping("/insertbill")
    @ResponseBody
    public Map<String,String> insertBill(@RequestBody Tbbill bill,HttpServletRequest request){
        Map<String,String> map = new HashMap<>();
        if(billService.insertBill(bill)){
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }

  /*  public Tbbill findAll(int draw, int start, int length, String roleName){
        PageInfo<Tbbill> pageInfo = billService.selectAuthRoleByPage((start/length)+1, length, roleName);
        Map<String, Object> map = new HashMap<String, Object>();
        List<Object> data = new ArrayList<Object>();
    }*/

    @RequestMapping("/editbill")
    @ResponseBody
    public Map<String,Object> editBill(@RequestBody Tbbill bill,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        if(billService.updateBill(bill)){
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }


    @RequestMapping("/selectbillbyid")
    @ResponseBody
    public Map<String,Object> selectbillbyid(@RequestBody Tbbill bill,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        Tbbill tbbill = billService.selectByBillId(bill.getBillid());
            map.put("data", tbbill);
        return map;
    }

}
