package dao;

import domain.*;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public interface ScenicInfoDao {
    List<String> selectScenicTheme() throws Exception;
    List<TagInfo> selectScenicTag() throws Exception;
    public int getScenicTotalCount();
    List<ScenicInfo> selectScenicInfoPage(int start,int row) throws Exception;
    public int getScenicCommentTotalCount(int scenicId);
    List<ScenicCommentInfo> selectScenicCommentPage(int scenicId, int start, int row) throws Exception;
    List<ScenicCommentInfo> selectScenicCommentChild(int scenicId, int start,int row) throws Exception;
    Map<Integer,String> selectScenicCommentUserName(int scenicId, int start,int row) throws Exception;
    ScenicInfo selectScenicInfoByScenicId(int scenicId) throws Exception;
    List<ScenicInfo> selectScenicNearByScenicId(int scenicId) throws Exception;

    //关于景点的偏好的修改
    int increaseUserPreferScenic(int userId, int scenicId, float weight)throws Exception;
    int decreaseUserPreferScenic(int userId, int scenicId, float weight)throws Exception;
    //收藏景点
    int collectScenic(int userId, int scenicId)throws Exception;
    //取消收藏景点
    int disCollectScenic(int userId, int scenicId)throws Exception;
    //添加评论
    int addScenicComment(ScenicCommentInfo scenicCommentInfo)throws Exception;
    //添加评论的图片
    int addScenicCommentPicture(int userId,int scenicCommentId, List<String> picturePathList)throws Exception;
    List<String> selectDowntownInland() throws Exception;
    List<String> selectDowntownAbroad() throws Exception;

    List<UserPreferInfo> selectUserPreferById(int userId) throws Exception;
    List<UserPreferInfo> selectOtherUserPreferById(int userId) throws Exception;
    int selectTagTotalCount() throws Exception;
    float selectUserTagWeight(int userId, int tagId) throws Exception;

    List<ScenicInfo> selectSimilarScenicByTag(List<Integer> similarUserId, int similarTagId) throws Exception;

    int queryScenicCountBySearchText(List<Integer> monthList,List<String> addrList,List<Integer> tagList) throws Exception;
    List<ScenicInfo> queryScenicBySearchText(List<Integer> monthList,List<String> addrList,List<Integer> tagList,int start,int rows) throws Exception;

    List<TicketInfo> queryTicketByScenicId(int scenicId) throws Exception;
    List<TicketDatePrice> queryTicketDatePrice(int ticketId) throws Exception;

    int saveTicketOrder(int ticketId,int userId,
                        Date ticketDate, int ticketPrice,
                        int ticketNum,int orderPrice,
                        String orderRemark) throws Exception;
    int saveTicketOrderTraveler(int ticketOrderId, String travelerName,
                        String travelerIdCard,String travelerTelephone) throws Exception;

}
