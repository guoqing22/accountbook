package com.welab.bill.controller;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.welab.bill.pojo.MyJss;
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

    /**
     * 根据日期范围查询账单
     * @param start_date 开始日期
     * @param end_date 结束日期
     * @param request
     * @return map json
     * @throws ParseException
     */
    @RequestMapping("/selectbill")
    @ResponseBody
    public Map<String,Object> selectByBillDate(@Param("start_date") String start_date,@Param("end_date") String end_date,
                                         HttpServletRequest request) throws ParseException {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date start = dateFormat.parse(start_date);
        Date end = dateFormat.parse(end_date);
        List<Tbbill> bill = billService.selectBill(start,end);
        Map<String,Object> map = new HashMap<>();
        map.put("data",bill);
        return map;
    }

    /**
     * 根据订单编号删除订单
     * @param bill 接受订单编号 json
     * @param request
     * @return map json
     */
    @RequestMapping("/deletebill")
    @ResponseBody
    public Map<String, String> deleteByBillId(@RequestBody Tbbill bill, HttpServletRequest request) {
        String billid = bill.getBillid();
        Map<String, String> map = new HashMap<>();
        if (billService.deleteBill(billid)) {
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }

    /**
     * 新增账单
     * @param bill 接受账单信息
     * @param request
     * @return map json
     */
    @RequestMapping("/insertbill")
    @ResponseBody
    public Map<String,String> insertBill(@RequestBody Tbbill bill,HttpServletRequest request){
        if (bill.getClassa()==""){
            bill.setClassa(null);
        }
        Map<String,String> map = new HashMap<>();
        if(billService.insertBill(bill)){
            map.put("successmsg", "success");
        } else {
            map.put("errormsg", "error");
        }
        return map;
    }

    /**
     * 根据账单编号修改账单
     * @param bill 接受账单信息 json
     * @param request
     * @return map json
     */
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

    /**
     * 通过订单编号查询订单
     * @param bill 接受订单编号 json
     * @param request
     * @return map json
     */
    @RequestMapping("/selectbillbyid")
    @ResponseBody
    public Map<String,Object> selectbillbyid(@RequestBody Tbbill bill,HttpServletRequest request){
        Map<String,Object> map = new HashMap<>();
        Tbbill tbbill = billService.selectByBillId(bill.getBillid());
            map.put("data", tbbill);
        return map;
    }

    /**
     * insert页面
     * @return
     */
    @RequestMapping("/insert")
    public String insert() {
        return "insert";
    }
    /**
     * insert页面
     * @return
     */
    @RequestMapping("/select")
    public String select() {
        return "select";
    }
    @RequestMapping("/ta")
    public String ta() {
        return "ta";
    }

    @RequestMapping("/tb")
    public String tb() {
        return "tb";
    }




    @RequestMapping("/mrmgsjdmtszqk")
    @ResponseBody
    public Map<String,Object> mrmgsjdmtszqk(@RequestBody MyJss myJss, HttpServletRequest request) throws ParseException {
        Map<String,Object> map = new HashMap<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Integer username = myJss.getUsername();
        String startDate = myJss.getStartDate();
        String endDate = myJss.getEndDate();
        Date start = dateFormat.parse(startDate);
        Date end = dateFormat.parse(endDate);
        List<MyJss> myJss1 = billService.mrmgsjdmtszqk(username,start,end);
        map.put("data", myJss1);
        return map;
    }

    @RequestMapping("/a")
    @ResponseBody
    public Map<String,Object> a(@RequestBody MyJss myJss, HttpServletRequest request) throws ParseException {
        System.out.println("hkhjhjkhkh");
        Map<String,Object> map = new HashMap<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Integer username = myJss.getUsername();
        String startDate = myJss.getStartDate();
        String endDate = myJss.getEndDate();
        Date start = dateFormat.parse(startDate);
        Date end = dateFormat.parse(endDate);
        List<MyJss> myJss1 = billService.a(username,start,end);
        map.put("data", myJss1);
        return map;
    }

    @RequestMapping("/b")
    @ResponseBody
    public Map<String,Object> b(@RequestBody MyJss myJss, HttpServletRequest request) throws ParseException {
        Map<String,Object> map = new HashMap<>();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Integer username = myJss.getUsername();
        String startDate = myJss.getStartDate();
        String endDate = myJss.getEndDate();
        Date start = dateFormat.parse(startDate);
        Date end = dateFormat.parse(endDate);
        List<MyJss> myJss1 = billService.b(username,start,end);
        map.put("data", myJss1);
        return map;
    }
}
