package dao.impl;

import dao.ScenicInfoDao;

import domain.*;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import utils.JDBCUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public class ScenicInfoDaoImpl implements ScenicInfoDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    NamedParameterJdbcTemplate namedParameterJdbcTemplate = new NamedParameterJdbcTemplate(JDBCUtils.getDataSource());
    //查找所有景点的标签
    @Override
    public List<String> selectScenicTheme() {
//        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "select scenicTheme,COUNT(*) from scenic GROUP by scenicTheme HAVING COUNT(*)>20 ORDER BY COUNT(*) DESC LIMIT 20;";

        return jdbcTemplate.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet rs, int rowNum)
                    throws SQLException {
                return rs.getString(1);
            }
        },null);
    }
    //查找所有景点的标签
    @Override
    public List<TagInfo> selectScenicTag() {
//        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "select * from tag ";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<TagInfo>(TagInfo.class));
    }
    //查找景点并分页中的总页数
    @Override
    public int getScenicTotalCount() {
        String sql = "select COUNT(scenicId) from scenic;";

        return jdbcTemplate.queryForObject(sql,Integer.class);
    }
    //查找景点，并分页展示
    @Override
    public List<ScenicInfo> selectScenicInfoPage(int start,int row){
        String sql="SELECT * FROM scenic WHERE (lng IS NOT NULL and lat is not NULL) LIMIT ?,?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class), start,row);

    }
    //查找这个景点的所有祖宗评论的页数
    public int getScenicCommentTotalCount(int scenicId) {
        String sql = "select COUNT(scenicId) from sceniccomment where scenicId = ? and parentId = -1;";

        return jdbcTemplate.queryForObject(sql,Integer.class,scenicId);
    }
    //查找这个景点的所有祖宗评论按照分页
    @Override
    public List<ScenicCommentInfo> selectScenicCommentPage(int scenicId, int start, int row) throws Exception {
        String sql="SELECT * FROM sceniccomment WHERE (scenicId = ? and parentId = -1) LIMIT ?,?";
        List<ScenicCommentInfo> scenicCommentInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicCommentInfo>(ScenicCommentInfo.class),scenicId, start,row);
        System.out.println(scenicCommentInfoList);
        return scenicCommentInfoList;
    }
    //查找这个景点的所有子孙评论
    @Override
    public List<ScenicCommentInfo> selectScenicCommentChild(int scenicId, int start, int row) throws Exception {
//        String sql="SELECT * FROM sceniccomment WHERE (parentId in (SELECT scenicCommentId FROM sceniccomment WHERE (scenicId = ? and parentId = -1) LIMIT ?,?))";
        String sql;
        sql = "SELECT * FROM sceniccomment WHERE parentCommentId in (SELECT comm.scenicCommentId FROM (select * from sceniccomment WHERE (scenicId = ? and parentId = -1) LIMIT ?,?)as comm);";
        List<ScenicCommentInfo> scenicCommentInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicCommentInfo>(ScenicCommentInfo.class),scenicId, start,row);
        System.out.println("***********************************************************");
        System.out.println(scenicCommentInfoList);
        return scenicCommentInfoList;
    }
    //查找这个景点的所有评论的用户的id和头像
    @Override
    public Map<Integer,String> selectScenicCommentUserName(int scenicId, int start, int row) throws Exception {
//        String sql="SELECT userId,userNickName from user where (userId IN (SELECT DISTINCT userId FROM sceniccomment WHERE (scenicId = ? and parentId = -1) LIMIT ?,?))";
//        //return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicCommentInfo>(ScenicCommentInfo.class),scenicId, start,row);
//        return jdbcTemplate.queryForList(sql,Map<Integer,String>.class,scenicId,start,row);
        return null;
    }
    //根据景点的id查找景点的信息
    @Override
    public ScenicInfo selectScenicInfoByScenicId(int scenicId) throws Exception {
        String sql = "select * from scenic where scenicId = ?";
        ScenicInfo scenicInfo = null;
        scenicInfo= jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class),scenicId);
        return scenicInfo;
    }

    @Override
    public List<ScenicInfo> selectScenicNearByScenicId(int scenicId) throws Exception {
        String sql;
        sql = "SELECT s2.* FROM scenic as s1,scenic as s2 where s1.scenicId = ? ORDER BY ((s1.lng-s2.lng)*(s1.lng-s2.lng)+(s1.lat-s2.lat)*(s1.lat-s2.lat)) ASC LIMIT 1,10;";
        List<ScenicInfo> scenicInfoList;
        scenicInfoList = jdbcTemplate.query(sql,new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class),scenicId);
        return scenicInfoList;
    }

    //景点改变的用户偏好(加)
    @Override
    public int increaseUserPreferScenic(int userId, int scenicId, float weight) throws Exception {
        String sql;
        sql = "UPDATE userprefer SET preferWeight = preferWeight+? where( userId = ? and tagId IN (SELECT tagId FROM taglink where type = '景点' and linkId = ?));";
        int result = jdbcTemplate.update(sql,weight,userId,scenicId);
        return result;
    }
    //景点改变的用户偏好(减)
    @Override
    public int decreaseUserPreferScenic(int userId, int scenicId, float weight) throws Exception {
        String sql;
        sql = "UPDATE userprefer SET preferWeight = preferWeight-? where( userId = ? and tagId IN (SELECT tagId FROM taglink where type = '景点' and linkId = ?));";
        int result = jdbcTemplate.update(sql,weight,userId,scenicId);
        return result;
    }
    //收藏景点
    @Override
    public int collectScenic(int userId, int scenicId) throws Exception {
        String sql;
        sql = "INSERT INTO sceniccollect VALUES(?,?);";
        int result=0;
        result = jdbcTemplate.update(sql,scenicId,userId);
        return result;
    }
    //取消景点收藏
    @Override
    public int disCollectScenic(int userId, int scenicId) throws Exception {
        String sql;
        sql = "DELETE FROM sceniccollect WHERE (scenicId = ? and userId = ?);";
        int result=0;
        result = jdbcTemplate.update(sql,scenicId,userId);
        return result;
    }

    @Override
    public int addScenicComment(ScenicCommentInfo scenicCommentInfo) throws Exception {
        String sql;
        int addResult = 0;
        sql = "INSERT INTO sceniccomment VALUES(?,?,?,?,?,?,?,?);";
        addResult = jdbcTemplate.update(sql
                ,scenicCommentInfo.getScenicCommentId()
                ,scenicCommentInfo.getParentId()
                ,scenicCommentInfo.getParentCommentId()
                ,scenicCommentInfo.getUserId()
                ,scenicCommentInfo.getScenicId()
                ,scenicCommentInfo.getScenicGrade()
                ,scenicCommentInfo.getCommentText()
                ,scenicCommentInfo.getScenicCommentState());
        sql = "SELECT LAST_INSERT_ID();";
        addResult = jdbcTemplate.queryForObject(sql,Integer.class);
        return addResult;
    }

    @Override
    public int addScenicCommentPicture(int userId, int scenicCommentId, List<String> picturePathList) {
        String sql;
        int addResult = 0;
        if(picturePathList!=null){
            for(int i = 0;i<picturePathList.size();i++){
                sql = "INSERT INTO sceniccommentpicture VALUES(?,?,?);";
                addResult = jdbcTemplate.update(sql,scenicCommentId,picturePathList.get(i),i);
            }
        }
        return addResult;
    }

    @Override
    public List<String> selectDowntownInland() throws Exception {
        String sql;
        sql = "select DISTINCT downtown from scenic where country='中国' ORDER BY downtown ASC;";
        List<String> downtownList = jdbcTemplate.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet rs, int rowNum)
                    throws SQLException {
                return rs.getString(1);
            }
        },null);
        return downtownList;
    }

    @Override
    public List<String> selectDowntownAbroad() throws Exception {
        String sql;
        sql = "select DISTINCT downtown from scenic where country<>'中国' ORDER BY downtown ASC;";
        List<String> downtownList = jdbcTemplate.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet rs, int rowNum)
                    throws SQLException {
                return rs.getString(1);
            }
        },null);
        return downtownList;
    }

    @Override
    public List<UserPreferInfo> selectUserPreferById(int userId) throws Exception {
        String sql;
        sql = "SELECT * from userprefer where userId = ?;";
        List<UserPreferInfo> userPreferInfoList;
        userPreferInfoList = jdbcTemplate.query(sql,new BeanPropertyRowMapper<UserPreferInfo>(UserPreferInfo.class),userId);
        return userPreferInfoList;
    }

    @Override
    public List<UserPreferInfo> selectOtherUserPreferById(int userId) throws Exception {
        String sql;
        sql = "SELECT * from userprefer where userId <> ?;";
        List<UserPreferInfo> userPreferInfoList;
        userPreferInfoList = jdbcTemplate.query(sql,new BeanPropertyRowMapper<UserPreferInfo>(UserPreferInfo.class),userId);
        return userPreferInfoList;
    }

    @Override
    public int selectTagTotalCount() throws Exception {
        String sql;
        sql = "SELECT COUNT(DISTINCT tagId) FROM userprefer;";
        int tagTotalCount;
        tagTotalCount = jdbcTemplate.queryForObject(sql,Integer.class);
        return tagTotalCount;
    }

    @Override
    public float selectUserTagWeight(int userId, int tagId) throws Exception {
        String sql;
        sql = "SELECT preferWeight FROM userprefer WHERE userId = ? and tagId = ?;";
        float userTagWeight;
        userTagWeight = jdbcTemplate.queryForObject(sql,Float.class,userId,tagId);
        return userTagWeight;
    }

    @Override
    public List<ScenicInfo> selectSimilarScenicByTag(List<Integer> similarUserId, int similarTagId) throws Exception {
        String sql;
        sql = "SELECT * FROM scenic WHERE\n" +
                "(scenicId IN (select scecoll.scenicId from(select * from sceniccollect where userId IN (:userIds) GROUP BY scenicId ORDER BY COUNT(userId) DESC LIMIT 30) as scecoll)\n" +
                "AND scenicId IN (SELECT linkId from taglink where tagId = :similarTagId)) LIMIT 6;";
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("userIds",similarUserId);
        parameterSource.addValue("similarTagId",similarTagId);
        List<ScenicInfo> scenicInfoList;
        scenicInfoList = namedParameterJdbcTemplate.query(sql,parameterSource,new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class));
        return scenicInfoList;
    }

    @Override
    public int queryScenicCountBySearchText(List<Integer> monthList, List<String> addrList, List<Integer> tagList) throws Exception {
        String sql;
        sql = "select COUNT(scenicId) from scenic WHERE (\n" +
                "(scenicSuitbaleMonth in (:monthList)) OR\n" +
                "(downtown in (:addrList)) OR\n" +
                "(scenicId in (select linkId FROM taglink where tagId in (:tagList))));";
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("monthList",monthList);
        parameterSource.addValue("addrList",addrList);
        parameterSource.addValue("tagList",tagList);

        int totalCount = 0;
        totalCount = namedParameterJdbcTemplate.queryForObject(sql,parameterSource,Integer.class);
        return totalCount;
    }

    @Override
    public List<ScenicInfo> queryScenicBySearchText(List<Integer> monthList, List<String> addrList, List<Integer> tagList,int start,int rows) throws Exception {
        String sql;
        if(monthList==null&&addrList==null&&tagList==null){
            sql = "select * from scenic where scenicId in (select sce.scenicId from(select * from sceniccollect GROUP BY scenicId ORDER BY COUNT(userId) DESC LIMIT ?,?) as sce);";
            List<ScenicInfo> scenicInfoNull = jdbcTemplate.query(sql,new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class),start,rows);
            return scenicInfoNull;
        }

        sql = "select * from scenic WHERE (\n" +
                "(scenicSuitbaleMonth in (:monthList)) OR\n" +
                "(downtown in (:addrList)) OR\n" +
                "(scenicId in (select linkId FROM taglink where tagId in (:tagList)))) LIMIT :start,:rows;";
        MapSqlParameterSource parameterSource = new MapSqlParameterSource();
        parameterSource.addValue("monthList",monthList);
        parameterSource.addValue("addrList",addrList);
        parameterSource.addValue("tagList",tagList);
        parameterSource.addValue("start",start);
        parameterSource.addValue("rows",rows);
        List<ScenicInfo> scenicInfoList;
        scenicInfoList = namedParameterJdbcTemplate.query(sql,parameterSource,new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class));
        return scenicInfoList;
    }

    @Override
    public List<TicketInfo> queryTicketByScenicId(int scenicId) throws Exception {
        String sql;
        sql = "select * from ticket where scenicId = ?";
        List<TicketInfo> ticketInfoList = jdbcTemplate.query(sql,new BeanPropertyRowMapper<TicketInfo>(TicketInfo.class),scenicId);
        return ticketInfoList;
    }

    @Override
    public List<TicketDatePrice> queryTicketDatePrice(int ticketId) throws Exception {
        String sql;
        sql = "select * from ticketdateprice where ticketId = ?";
        List<TicketDatePrice> ticketDatePriceList = jdbcTemplate.query(sql,new BeanPropertyRowMapper<TicketDatePrice>(TicketDatePrice.class),ticketId);
        return ticketDatePriceList;
    }

    @Override
    public int saveTicketOrder(int ticketId, int userId, Date ticketDate,
                               int ticketPrice, int ticketNum, int orderPrice,
                               String orderRemark) throws Exception {
        String sql;
        sql = "insert into ticketorder values(0,?,?,?,?,?,?,?,?,?,?,0)";
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat("yyyy-MM-dd");
        int saveResult;
        jdbcTemplate.update(sql,ticketId,userId,simpleDateFormat1.format(ticketDate),ticketPrice,simpleDateFormat.format(date),ticketNum,orderPrice,orderRemark,1,simpleDateFormat.format(date));
        sql = "SELECT LAST_INSERT_ID();";
        int ticketOrderId = jdbcTemplate.queryForObject(sql,Integer.class);
        return ticketOrderId;


    }
    @Override
    public int saveTicketOrderTraveler(int ticketOrderId, String travelerName,
                               String travelerIdCard,String travelerTelephone) throws Exception {
        String sql;
        sql = "insert into ticketordertraveler values (0,?,?,?,?,0);";
        int saveResult = jdbcTemplate.update(sql,ticketOrderId,travelerName,travelerTelephone,travelerIdCard);
        return saveResult;

    }

    public static void main(String[] args) {

    }


}
