package test;

import dao.impl.UserInfoDaoImpl;
import domain.UserInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import utils.JDBCUtils;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

/**
 * @Author: 李旺旺
 * @Date: 2021/4/4 14:04
 * @Description: 数据库语句测试类
 */
public class SQLTest {

    public static void main(String[] args) {

        JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
        String sql;
        for(int i=605;i<1106;i++){
            System.out.println(i%66+1);
            sql = "UPDATE scenic SET scenicCoverPicture = 'scenic"+(i%66+1)+".jpeg' where scenicId = "+i+" ;";
            jdbcTemplate.update(sql);
        }

    }
}
