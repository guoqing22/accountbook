package com.welab.bill.service;

import com.welab.bill.dao.TbbillMapper;
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
     * @param bill
     * @return
     */
    public boolean insertBill(Tbbill bill);
    /**
     * 根据帐单编号修改账单
     * @param bill
     * @return
     */
    public boolean updateBill(Tbbill bill);

    /**
     * 根据帐单编号删除账单
     * @param billId 订单编号
     * @return
     */
    public boolean delectBill(String billId);

    /**
     * jdbcType=TIMESTAMP
     * @param startdate 开始时间
     * @param enddate 结束时间
     * @return
     */
    public List<Tbbill> selectBill(Date startdate,Date enddate);
}
