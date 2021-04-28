package dao;

import domain.PageBean;
import domain.ScenicCommentInfo;
import domain.ScenicInfo;

import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public interface ScenicInfoDao {
    List<String> selectScenicTheme() throws Exception;
    public int getScenicTotalCount();
    List<ScenicInfo> selectScenicInfoPage(int start,int row) throws Exception;
    public int getScenicCommentTotalCount(int scenicId);
    List<ScenicCommentInfo> selectScenicCommentPage(int scenicId, int start, int row) throws Exception;
    List<ScenicCommentInfo> selectScenicCommentChild(int scenicId, int start,int row) throws Exception;
    Map<Integer,String> selectScenicCommentUserName(int scenicId, int start,int row) throws Exception;
    ScenicInfo selectScenicInfoByScenicId(int scenicId) throws Exception;

    int collectScenic(int userId, int scenicId)throws Exception;
    int increaseUserPreferScenic(int userId, int scenicId, float weight)throws Exception;
    int disCollectScenic(int userId, int scenicId)throws Exception;
    int decreaseUserPreferScenic(int userId, int scenicId, float weight)throws Exception;

}
