package com.welab.bill.pojo;

/**
 * @package: com.welab.bill.pojo
 * @author: qing
 * @date: 2018/1/7
 * @time: 20:18
 **/

public class MyJss {
    public Double getDepositAmount() {
        return depositAmount;
    }

    public void setDepositAmount(Double depositAmount) {
        this.depositAmount = depositAmount;
    }

    public Double getDrawAmount() {
        return drawAmount;
    }

    public void setDrawAmount(Double drawAmount) {
        this.drawAmount = drawAmount;
    }

    public Double getNetBalance() {
        return netBalance;
    }

    public void setNetBalance(Double netBalance) {
        this.netBalance = netBalance;
    }

    public String getMyDate() {
        return myDate;
    }

    public void setMyDate(String myDate) {
        this.myDate = myDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public Integer getUsername() {
        return username;
    }

    public void setUsername(Integer username) {
        this.username = username;
    }

    /**
     * 收入
     */
    private Double depositAmount;
    /**
     * 支出
     */
    private Double drawAmount;
    /**
     * 余额
     */
    private Double netBalance;
    /**
     * 日期
     */
    private String myDate;
    /**
     * 开始日期
     */
    private String startDate;
    /**
     * 结束日期
     */
    private String endDate;
    /**
     * 用户名
     */
    private Integer username;


}
