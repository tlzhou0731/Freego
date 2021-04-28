package service.impl;

import dao.ScenicInfoDao;
import dao.impl.ScenicInfoDaoImpl;
import domain.PageBean;
import domain.ScenicCommentInfo;
import domain.ScenicInfo;
import service.ScenicInfoService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public class ScenicInfoServiceImpl implements ScenicInfoService {
    private ScenicInfoDao scenicInfoDao;
    public ScenicInfoServiceImpl(ScenicInfoDao scenicInfoDao){
        this.scenicInfoDao = scenicInfoDao;
    }

    //查询景点的标签
    @Override
    public List<String> queryScenicTheme() {
        try {
            return scenicInfoDao.selectScenicTheme();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //按照分页查询景点信息
    @Override
    public PageBean<ScenicInfo> queryScenicInfoPage(String currentPageStr, String rowsStr){
        try {
            int currentPage = Integer.parseInt(currentPageStr);
            int rows = Integer.parseInt(rowsStr);
            //1创建新的pageBean对象
            PageBean<ScenicInfo> pageBean=new PageBean<ScenicInfo>();
            //2.设置当前页面属性和row（row)是页面大小
            pageBean.setCurrentPage(currentPage);
            pageBean.setPageSize(rows);
            //3.调用dao查询totalCount总记录数
            int totalCount=scenicInfoDao.getScenicTotalCount();
            //4start = (currentPage-1)*row;
            pageBean.setTotalCount(totalCount);
            //5.调用dao查询list集合
            int start = (currentPage-1)*rows;
            List<ScenicInfo> scenicInfoList=scenicInfoDao.selectScenicInfoPage(start,rows);
            pageBean.setList(scenicInfoList);
            //6.计算总页码
            int totalPage = totalCount%rows==0?(totalCount/rows):(totalCount/rows+1);
            pageBean.setTotalPage(totalPage);
            //7.返回pageBean
            return pageBean;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //按照分页查询当前景点的所有祖宗评论
    @Override
    public PageBean<ScenicCommentInfo> queryScenicComment(String scenicIdStr, String currentPageStr, String rowsStr) {
        try {
            int currentPage = Integer.parseInt(currentPageStr);
            int rows = Integer.parseInt(rowsStr);
            int scenicId = Integer.parseInt(scenicIdStr);
            //1创建新的pageBean对象
            PageBean<ScenicCommentInfo> pageBean=new PageBean<ScenicCommentInfo>();
            //2.设置当前页面属性和row（row)是页面大小
            pageBean.setCurrentPage(currentPage);
            pageBean.setPageSize(rows);
            //3.调用dao查询totalCount总记录数
            int totalCount=scenicInfoDao.getScenicCommentTotalCount(scenicId);
            //4start = (currentPage-1)*row;
            pageBean.setTotalCount(totalCount);
            //5.调用dao查询list集合
            int start = (currentPage-1)*rows;
            List<ScenicCommentInfo> scenicInfoList=scenicInfoDao.selectScenicCommentPage(scenicId, start, rows);
            pageBean.setList(scenicInfoList);
            //6.计算总页码
            int totalPage = totalCount%rows==0?(totalCount/rows):(totalCount/rows+1);
            pageBean.setTotalPage(totalPage);
            //7.返回pageBean
            return pageBean;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //查询当前景点的所有孩子评论
    @Override
    public List<ScenicCommentInfo> queryScenicCommentChild(String scenicIdStr, String currentPageStr, String rowsStr) {
        try {
            int currentPage = Integer.parseInt(currentPageStr);
            int rows = Integer.parseInt(rowsStr);
            int scenicId = Integer.parseInt(scenicIdStr);
            //5.调用dao查询list集合
            int start = (currentPage-1)*rows;
            List<ScenicCommentInfo> scenicInfoList=scenicInfoDao.selectScenicCommentChild(scenicId, start, rows);
            //7.返回List
            return scenicInfoList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //查询当前景点的所有评论用户的用户id和对应头像
    @Override
    public Map<Integer,String> queryScenicCommentUserName(String scenicIdStr, String currentPageStr, String rowsStr) {
        try {
            int currentPage = Integer.parseInt(currentPageStr);
            int rows = Integer.parseInt(rowsStr);
            int scenicId = Integer.parseInt(scenicIdStr);
            //5.调用dao查询list集合
            int start = (currentPage-1)*rows;
            Map<Integer,String> userNames=scenicInfoDao.selectScenicCommentUserName(scenicId, start, rows);
            //7.返回Map
            return userNames;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //按照景点id查询景点信息
    @Override
    public ScenicInfo findScenicInfoByScenicId(String scenicIdStr) {
        try {
            int scenicId = Integer.parseInt(scenicIdStr);
            ScenicInfo scenicInfo = scenicInfoDao.selectScenicInfoByScenicId(scenicId);
            //7.返回Map
            return scenicInfo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    //收藏景点的行为
    @Override
    public int collectScenic(String userIdStr, String scenicIdStr) {
        int collectResult = 0;
        int preferResult = 0;
        int userId = Integer.parseInt(userIdStr);
        int scenicId = Integer.parseInt(scenicIdStr);
        try {
            collectResult = scenicInfoDao.collectScenic(userId,scenicId);
            return collectResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            preferResult = scenicInfoDao.increaseUserPreferScenic(userId,scenicId,(float)0.5);
            return preferResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    //取消收藏景点的这个行为
    @Override
    public int disCollectScenic(String userIdStr, String scenicIdStr) {
        int disCollectResult = 0;
        int preferResult = 0;
        int userId = Integer.parseInt(userIdStr);
        int scenicId = Integer.parseInt(scenicIdStr);
        try {
            disCollectResult = scenicInfoDao.disCollectScenic(userId,scenicId);
            return disCollectResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            preferResult = scenicInfoDao.decreaseUserPreferScenic(userId,scenicId,(float)0.5);
            return preferResult;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    //评论景点这个行为
    public int commentScenic(String parentIdStr
            ,String parentCommentIdStr
            ,String userIdStr
            ,String scenicIdStr
            ,String scenicGradeStr
            ,String commentText
            ,String scenicCommentStateStr
            ,List<String> scenicCommentPictureList){
        int addCommentResult=0,addCommentPictureResult=0,dealPreferResult=0;
        int parentId = Integer.parseInt(parentIdStr);
        int parentCommentId = Integer.parseInt(parentCommentIdStr);
        int userId = Integer.parseInt(userIdStr);
        int scenicId = Integer.parseInt(scenicIdStr);
        int scenicGrade = Integer.parseInt(scenicGradeStr);
        int scenicCommentState = Integer.parseInt(scenicCommentStateStr);
        //添加评论
        try {
            ScenicCommentInfo scenicCommentInfo = new ScenicCommentInfo(0,parentId,parentCommentId,userId,scenicId,scenicGrade,commentText,scenicCommentState==1);
            addCommentResult = scenicInfoDao.addScenicComment(scenicCommentInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //添加评论的图片
        try {
            addCommentResult = scenicInfoDao.addScenicCommentPicture(userId,addCommentResult,scenicCommentPictureList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //更新
        try {
            dealPreferResult = scenicInfoDao.increaseUserPreferScenic(userId,scenicId,(float)0.4);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }


}
