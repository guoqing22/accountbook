package com.welab.bill.service.impl;

import com.welab.bill.dao.TbbillMapper;
import com.welab.bill.pojo.MyJss;
import com.welab.bill.pojo.Tbbill;
import com.welab.bill.service.IBillService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @package: com.welab.bill.service.impl
 * @author: qing
 * @date: 2017/12/13
 * @time: 21:12
 **/
@Service("billservice")
public class BillServiceImpl implements IBillService {

    @Resource
    private TbbillMapper billMapper;

    /**
     * 添加账单
     *
     * @param bill
     * @return
     */
    @Override
    public boolean insertBill(Tbbill bill) {
        int num = billMapper.insertSelective(bill);
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据帐单编号修改账单
     *
     * @param bill
     * @return
     */
    @Override
    public boolean updateBill(Tbbill bill) {
        int num = billMapper.updateByPrimaryKeySelective(bill);
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据帐单编号删除账单
     *
     * @param billId 订单编号
     * @return
     */
    @Override
    public boolean deleteBill(String billId) {
        int num = billMapper.deleteByPrimaryKey(billId);
        if (num == 1) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 根据时间范围查找订单
     *
     * @param startdate 开始时间
     * @param enddate   结束时间
     * @return
     */
    @Override
    public List<Tbbill> selectBill(Date startdate,Date enddate) {
        List<Tbbill> list = new ArrayList<>();
        list = billMapper.selectByBillDate(startdate,enddate);
        return list;
    }

    /**
     * @return
     */
    @Override
    public List<Tbbill> findAll() {
        List<Tbbill> list = new ArrayList<>();
        list = billMapper.findAll();
        return list;
    }

    /**
     * 根据订单号查询订单信息
     *
     * @param billid 订单号
     * @return
     */
    @Override
    public Tbbill selectByBillId(String billid) {
        Tbbill bill = billMapper.selectByPrimaryKey(billid);
        return bill;
    }

    /**
     * 查询某人某个时间段内每天的收支情况
     *
     * @param username  用户名
     * @param startdate 开始日期
     * @param enddate   结束日期
     * @return
     */
    @Override
    public List<MyJss> mrmgsjdmtszqk(Integer username, Date startdate, Date enddate) {
        List<MyJss> myJss = billMapper.mrmgsjdmtszqk(username,startdate,enddate);
        return myJss;
    }

    @Override
    public List<MyJss> a(Integer username, Date startdate, Date enddate) {
        List<MyJss> myJss = billMapper.a(username,startdate,enddate);
        return myJss;
    }

    @Override
    public List<MyJss> b(Integer username, Date startdate, Date enddate) {
        List<MyJss> myJss = billMapper.b(username,startdate,enddate);
        return myJss;
    }

}
