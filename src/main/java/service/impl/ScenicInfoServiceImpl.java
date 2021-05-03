package service.impl;

import alrithmetic.Sort;
import dao.ScenicInfoDao;
import dao.impl.ScenicInfoDaoImpl;
import domain.*;
import service.ScenicInfoService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
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
    //查询景点的标签
    @Override
    public Map<Integer,String> queryScenicTag() {
        Map<Integer,String> tagMap = new HashMap<>();

        try {
            List<TagInfo> totalTag = scenicInfoDao.selectScenicTag();
            for(int i = 0 ; i<totalTag.size();i++){
                tagMap.put(totalTag.get(i).getTagId(),totalTag.get(i).getTagName());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return tagMap;
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

    ////////////////////////之前是返回null
    @Override
    public List<ScenicInfo> queryScenicNearByScenicId(String scenicIdStr) {
        int scenicId = Integer.parseInt(scenicIdStr);
        List<ScenicInfo> scenicInfoList = new ArrayList<ScenicInfo>();
        try {
            scenicInfoList = scenicInfoDao.selectScenicNearByScenicId(scenicId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return scenicInfoList;
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
            if(scenicGrade==1){
                dealPreferResult = scenicInfoDao.decreaseUserPreferScenic(userId,scenicId,(float)0.8);
            }
            if(scenicGrade==2){
                dealPreferResult = scenicInfoDao.decreaseUserPreferScenic(userId,scenicId,(float)0.4);
            }
            if(scenicGrade==3){
                dealPreferResult = scenicInfoDao.increaseUserPreferScenic(userId,scenicId,(float)0.1);
            }
            if(scenicGrade==4){
                dealPreferResult = scenicInfoDao.increaseUserPreferScenic(userId,scenicId,(float)0.4);
            }
            if(scenicGrade==5){
                dealPreferResult = scenicInfoDao.increaseUserPreferScenic(userId,scenicId,(float)0.8);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    @Override
    public List<String> queryDowntownInland() {
        try {
            return scenicInfoDao.selectDowntownInland();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<String> queryDowntownAbroad() {
        try {
            return scenicInfoDao.selectDowntownAbroad();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Integer> querySimilarUser(String userIdStr) {
        int userReturnCount = 15;
        List<UserPreferInfo> thisUser;
        List<UserPreferInfo> otherUser;
        int userId = Integer.parseInt(userIdStr);
        int tagCount = 0;
        float thisUserLen = 0;
        List<Float> otherUserLen = new ArrayList<Float>();
        List<Float> otherUserDian = new ArrayList<Float>();
        int otherUserCount = 0;
        float dianTemp=0,lenTemp=0;
        Map<Integer,Float> likeUserPrefer = new HashMap<>();
        List<Integer> likeUserReturn = new ArrayList<Integer>();
        try {
            tagCount = scenicInfoDao.selectTagTotalCount();
            thisUser = scenicInfoDao.selectUserPreferById(userId);
            otherUser = scenicInfoDao.selectOtherUserPreferById(userId);
            otherUserCount = otherUser.size()/tagCount;
            //遍历每个其他用户
            for(int i = 0 ; i < otherUserCount ; i++){
                //遍历每个用户对标签的喜爱
                dianTemp = 0;
                lenTemp = 0;
                for(int j = 0 ; j < tagCount ; j++){
                    dianTemp += thisUser.get(j).getPreferWeight()*otherUser.get(i*tagCount+j).getPreferWeight();
                    lenTemp += otherUser.get(i*tagCount+j).getPreferWeight()*otherUser.get(i*tagCount+j).getPreferWeight();
                }
                otherUserDian.add(dianTemp);
                otherUserLen.add(lenTemp);
            }
            //所得的otherUserDian是每个其他用户和这一用户的点积
            //所得的otherUserLen是每个其他用户的向量模
            for(int i = 0 ; i < tagCount ; i++){
                thisUserLen += thisUser.get(i).getPreferWeight()*thisUser.get(i).getPreferWeight();
            }

            for(int i = 0 ; i < otherUserCount ; i++){
                likeUserPrefer.put(otherUser.get(i*tagCount).getUserId(),otherUserDian.get(i)/(thisUserLen*otherUserLen.get(i)));
            }

            likeUserPrefer = Sort.sortMapByValues(likeUserPrefer);

            for(Integer key: likeUserPrefer.keySet()){
                float similarValue = likeUserPrefer.get(key);
                System.out.println("key = "+key+" and value = "+similarValue);
            }
            int count = 0;
            for(Integer key: likeUserPrefer.keySet()){
                likeUserReturn.add(key);
                count++;
                if(count>=userReturnCount){
                    break;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return likeUserReturn;
    }

    @Override
    public List<Integer> querySimilarTag(String userIdStr) {
        int tagReturnCount = 6;
        int tagTotalCount = 0;
        float tagWeightTemp = 0;
        List<Integer> similarUser;
        int similarUserCount = 0;
        Map<Integer,Float> weightMaxTag = new HashMap<>();
        List<Integer> similarTagReturn = new ArrayList<Integer>();
        int count = 0;
        try{
            similarUser = querySimilarUser(userIdStr);
            similarUserCount = similarUser.size();
            tagTotalCount = scenicInfoDao.selectTagTotalCount();
            for(int i = 0 ; i < tagTotalCount ; i++){
                tagWeightTemp = 0 ;
                for(int j = 0 ; j < similarUserCount ; j++){
                    tagWeightTemp += scenicInfoDao.selectUserTagWeight(similarUser.get(j),i+1);
                }
                weightMaxTag.put(i+1,tagWeightTemp);
            }
            weightMaxTag = Sort.sortMapByValues(weightMaxTag);
            for(Integer key : weightMaxTag.keySet()){
                System.out.println("tagId = "+key+" and weightSum = "+weightMaxTag.get(key));
            }
            for(Integer key: weightMaxTag.keySet()){
                similarTagReturn.add(key);
                count++;
                if(count>=tagReturnCount){
                    break;
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return similarTagReturn;
    }


    public Map<Integer,List<ScenicInfo>> querySimilarScenic(String userIdStr){
        List<Integer> similarUserId = querySimilarUser(userIdStr);
        List<Integer> similarTagId = querySimilarTag(userIdStr);
        Map<Integer,List<ScenicInfo>> tagScenicRecommend = new HashMap<>();
        try{
            for(int i = 0 ; i < similarTagId.size() ; i++){
                List<ScenicInfo> tempTagScenic = scenicInfoDao.selectSimilarScenicByTag(similarUserId,similarTagId.get(i));
                tagScenicRecommend.put(similarTagId.get(i),tempTagScenic);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return tagScenicRecommend;
    }

    @Override
    public PageBean<ScenicInfo> queryScenicBySearch(List<Integer> monthList, List<String> addrList, List<Integer> tagList, String currentPageStr, String rowsStr) {
        try {
            int currentPage = Integer.parseInt(currentPageStr);
            int rows = Integer.parseInt(rowsStr);
            //1创建新的pageBean对象
            PageBean<ScenicInfo> pageBean=new PageBean<ScenicInfo>();
            //2.设置当前页面属性和row（row)是页面大小
            pageBean.setCurrentPage(currentPage);
            pageBean.setPageSize(rows);
            //3.调用dao查询totalCount总记录数
            int totalCount=scenicInfoDao.queryScenicCountBySearchText(monthList,addrList,tagList);
            //4start = (currentPage-1)*row;
            pageBean.setTotalCount(totalCount);
            //5.调用dao查询list集合
            int start = (currentPage-1)*rows;
            List<ScenicInfo> scenicInfoList=scenicInfoDao.queryScenicBySearchText(monthList,addrList,tagList,start,rows);
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

    public static void main(String[] args) {
        ScenicInfoService scenicInfoService = new ScenicInfoServiceImpl(new ScenicInfoDaoImpl());
        List<Integer> likeUser = scenicInfoService.querySimilarUser("1010");
        for(int i = 0;i<likeUser.size();i++){
            System.out.println(likeUser.get(i));
        }
        List<Integer> likeTag = scenicInfoService.querySimilarTag("1010");
        for(int i = 0;i<likeTag.size();i++){
            System.out.println(likeTag.get(i));
        }
        Map<Integer,List<ScenicInfo>> tagScenicMap = scenicInfoService.querySimilarScenic("1010");
        for(Integer key:tagScenicMap.keySet()){
            List<ScenicInfo> tagScenicList = tagScenicMap.get(key);
            System.out.println("key = "+key);
            for(int i = 0 ; i < tagScenicList.size() ; i++){
                System.out.println(tagScenicList.get(i));
            }
        }
    }


}
