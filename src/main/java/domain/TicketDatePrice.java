package domain;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Create By Intellij idea
 * Author:Macro
 * Date:2021/5/16
 * Time:15:35
 * Describe:
 */

public class TicketDatePrice {
    int ticketId;
    Date ticketDate;
    int ticketPrice;
    int ticketNum;

    public TicketDatePrice() {
    }

    public TicketDatePrice(int ticketId, Date ticketDate, int ticketPrice, int ticketNum) {
        this.ticketId = ticketId;
        this.ticketDate = ticketDate;
        this.ticketPrice = ticketPrice;
        this.ticketNum = ticketNum;
    }

    public int getTicketId() {
        return ticketId;
    }

    public void setTicketId(int ticketId) {
        this.ticketId = ticketId;
    }

    public Date getTicketDate() {
        return ticketDate;
    }

    public void setTicketDate(Date ticketDate) {
        this.ticketDate = ticketDate;
    }

    public int getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(int ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public int getTicketNum() {
        return ticketNum;
    }

    public void setTicketNum(int ticketNum) {
        this.ticketNum = ticketNum;
    }

    public String toString(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return "门票id为："+ticketId+"   门票日期为："+simpleDateFormat.format(ticketDate)+"   门票价格："+ticketPrice+"    门票数量为:"+ticketNum;
    }

}
