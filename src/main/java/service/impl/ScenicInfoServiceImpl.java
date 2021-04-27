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
    @Override
    public List<String> queryScenicTheme() {
        try {
            return scenicInfoDao.selectScenicTheme();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

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

}
