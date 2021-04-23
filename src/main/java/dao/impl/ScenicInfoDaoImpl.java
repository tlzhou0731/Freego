package dao.impl;

import dao.ScenicInfoDao;

import domain.PageBean;
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
    public int getTotalCount() {
        String sql = "select COUNT(scenicId) from scenic;";
        StringBuilder sb = new StringBuilder(sql);
        return jdbcTemplate.queryForObject(sb.toString(),Integer.class);
    }

    @Override
    public List<ScenicInfo> selectScenicInfoPage(PageBean<ScenicInfo> pBean){

        String sql="SELECT * FROM scenic LIMIT ?,?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class),(pBean.getCurrentPage()-1)*pBean.getPageSize(),pBean.getPageSize());
    }


}
