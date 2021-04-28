package dao.impl;

import dao.ScenicInfoDao;

import domain.PageBean;
import domain.ScenicCommentInfo;
import domain.ScenicInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.JDBCUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public class ScenicInfoDaoImpl implements ScenicInfoDao {
    JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    //查找所有景点的标签
    @Override
    public List<String> selectScenicTheme() {
//        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "select scenicTheme,COUNT(*) from scenic GROUP by scenicTheme HAVING COUNT(*)>20 ORDER BY COUNT(*) DESC LIMIT 20;";
        System.out.println("GETINDAOIMPL");

        return jdbcTemplate.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet rs, int rowNum)
                    throws SQLException {
                return rs.getString(1);
            }
        },null);
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
        for(int i = 0;i<picturePathList.size();i++){
            sql = "INSERT INTO sceniccommentpicture VALUES(?,?,?);";
            addResult = jdbcTemplate.update(sql,scenicCommentId,picturePathList.get(i),i);
        }
        return addResult;
    }

    public static void main(String[] args) {
        JdbcTemplate jdbcTemplate2 = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql = "INSERT INTO sceniccomment VALUES(?,?,?,?,?,?,?,?);";
        jdbcTemplate2.update(sql,0,1005,1002,1025,608,4,"AAAAAAAAAAA",0);
        sql = "SELECT LAST_INSERT_ID();";
        int addResult = jdbcTemplate2.queryForObject(sql,Integer.class);
        System.out.println(addResult);
    }

}
