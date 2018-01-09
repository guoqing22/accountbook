package com.welab.bill.service;

import com.welab.bill.dao.TbbillMapper;
import com.welab.bill.pojo.MyJss;
import com.welab.bill.pojo.Tbbill;

import javax.annotation.Resources;
import java.util.Date;
import java.util.List;

/**
 * @package: com.welab.bill.service
 * @author: qing
 * @date: 2017/12/13
 * @time: 21:12
 **/
public interface IBillService {
    /**
     * 添加账单
     *
     * @param bill
     * @return
     */
    public boolean insertBill(Tbbill bill);
    /**
     * 根据帐单编号修改账单
     *
     * @param bill
     * @return
     */
    public boolean updateBill(Tbbill bill);

    /**
     * 根据帐单编号删除账单
     *
     * @param billId 订单编号
     * @return
     */
    public boolean deleteBill(String billId);

    /**
     * 根据时间范围查找订单
     *
     * @param startdate 开始时间
     * @param enddate 结束时间
     * @return
     */
    public List<Tbbill> selectBill(Date startdate,Date enddate);


    public List<Tbbill> findAll();

    /**
     * 根据订单号查询订单信息
     *
     * @param billid 订单号
     * @return bill 订单信息
     */
    public  Tbbill selectByBillId(String billid);

    /**
     * 查询某人某个时间段内每天的收支情况
     *
     * @param username 用户名
     * @param startdate 开始日期
     * @param enddate 结束日期
     * @return
     */
    public List<MyJss> mrmgsjdmtszqk(Integer username,Date startdate,Date enddate);


    public List<MyJss> a(Integer username,Date startdate,Date enddate);

    public List<MyJss> b(Integer username,Date startdate,Date enddate);
}
