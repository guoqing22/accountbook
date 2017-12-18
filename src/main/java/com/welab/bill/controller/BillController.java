package com.welab.bill.controller;

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
        System.out.println(start_date);
        System.out.println(end_date);

        List<Tbbill> bill = billService.selectBill(start_date,end_date);

        return bill;
    }
}
