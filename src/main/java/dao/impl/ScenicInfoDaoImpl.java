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

    @Override
    public int getScenicTotalCount() {
        String sql = "select COUNT(scenicId) from scenic;";

        return jdbcTemplate.queryForObject(sql,Integer.class);
    }

    @Override
    public List<ScenicInfo> selectScenicInfoPage(int start,int row){

        String sql="SELECT * FROM scenic WHERE (lng IS NOT NULL and lat is not NULL) LIMIT ?,?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class), start,row);
    }

    public int getScenicCommentTotalCount(int scenicId) {
        String sql = "select COUNT(scenicId) from sceniccomment where scenicId = ? and parentId = -1;";

        return jdbcTemplate.queryForObject(sql,Integer.class,scenicId);
    }

    @Override
    public List<ScenicCommentInfo> selectScenicCommentPage(int scenicId, int start, int row) throws Exception {
        String sql="SELECT * FROM sceniccomment WHERE (scenicId = ? and parentId = -1) LIMIT ?,?";
        List<ScenicCommentInfo> scenicCommentInfoList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicCommentInfo>(ScenicCommentInfo.class),scenicId, start,row);
        System.out.println(scenicCommentInfoList);
        return scenicCommentInfoList;
    }

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

    @Override
    public Map<Integer,String> selectScenicCommentUserName(int scenicId, int start, int row) throws Exception {
//        String sql="SELECT userId,userNickName from user where (userId IN (SELECT DISTINCT userId FROM sceniccomment WHERE (scenicId = ? and parentId = -1) LIMIT ?,?))";
//        //return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicCommentInfo>(ScenicCommentInfo.class),scenicId, start,row);
//        return jdbcTemplate.queryForList(sql,Map<Integer,String>.class,scenicId,start,row);
        return null;
    }

    @Override
    public ScenicInfo selectScenicInfoByScenicId(int scenicId) throws Exception {
        String sql = "select * from scenic where scenicId = ?";
        ScenicInfo scenicInfo = null;
        scenicInfo= jdbcTemplate.queryForObject(sql,new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class),scenicId);
        return scenicInfo;
    }


}
