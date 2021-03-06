package service;

import domain.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public interface ScenicInfoService {
    public List<String> queryScenicTheme();

    public Map<Integer,String> queryScenicTag();

    public PageBean<ScenicInfo> queryScenicInfoPage(String currentPage, String row);

    public List<ScenicInfo> queryScenicNearByScenicId(String scenicIdStr);

    public PageBean<ScenicCommentInfo> queryScenicComment(String scenicId, String currentPage, String rows);

    public List<ScenicCommentInfo> queryScenicCommentChild(String scenicId, String currentPage, String rows);

    public Map<Integer,String> queryScenicCommentUserName(String scenicId, String currentPage, String rows);

    public ScenicInfo findScenicInfoByScenicId(String scenicIdStr);

    public int collectScenic(String userIdStr, String scenicIdStr);

    public int disCollectScenic(String userIdStr, String scenicIdStr);

    public int commentScenic(String parentIdStr
            ,String parentCommentIdStr
            ,String userIdStr
            ,String scenicIdStr
            ,String scenicGradeStr
            ,String commentText
            ,String scenicCommentStateStr
            ,List<String> scenicCommentPictureList);

    public List<String> queryDowntownInland();
    public List<String> queryDowntownAbroad();
    public List<Integer> querySimilarUser(String userIdStr);
    public List<Integer> querySimilarTag(String userIdStr);
    public Map<Integer,List<ScenicInfo>> querySimilarScenic(String userIdStr);

    public List<TicketInfo> queryTicketInfo(int scenicId);
    public List<TicketDatePrice> queryTicketDatePrice(int ticketId);

    public PageBean<ScenicInfo> queryScenicBySearch(List<Integer> monthList,List<String> addrList,List<Integer> tagList, String currentPageStr, String rowsStr);
    public int saveOrder(int userId, int ticketId, Date ticketDate, int ticketPrice, int ticketNum, int orderPrice, String orderRemark, String travelerName, String travelerTelephone, String travelerIdCard);

}
