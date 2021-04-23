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

        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

//        UserInfoDaoImpl userInfoDao = new UserInfoDaoImpl();
//
//        UserInfo userInfo = new UserInfo("15356145755","876213908@qq.com","Joshua Genter","123456789","男","湖人总冠军","","","",false);
//        userInfo.setUserId(1055);
        /*
        Boolean result = userInfoDao.isUserCellnumberExist("11156145755");

        Boolean result = userInfoDao.saveUserInfo(userInfo);

        Boolean result = userInfoDao.isAccountRight("", "2458581048@qq.com", "123456789");

        Boolean result = userInfoDao.isUserFollowed(1001,5);
        Boolean result = userInfoDao.updateUserInfo(userInfo);
        System.out.println(result);
        */

//        String sql = null;
//        //1.定义sql语句
//        sql = "select * from user where userId in (select userconcern.`userId` from userconcern where followId = ?)";
//        //2.执行
//        List<UserInfo> list = null;
//        list = template.query(sql, new BeanPropertyRowMapper<UserInfo>(UserInfo.class), 1051);
//
//        list.sort(Comparator.comparing(UserInfo::getUserId).reversed());
//        Iterator<UserInfo> iter = list.iterator();
//        while(iter.hasNext()) {
//            System.out.println(iter.next());
//        }

//        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

        String sql;
        //1.定义sql语句
        sql = "select scenicTheme,COUNT(*) from scenic GROUP by scenicTheme HAVING COUNT(*)>61 ORDER BY COUNT(*) DESC;";
        //2.执行
        List<String> scenicThemeList;
        String parameter=null;
        /**
         * parameter是sql语句中的 ？ 的值
         * 没有可不填
         */
        scenicThemeList = template.query(sql, new RowMapper<String>(){
            public String mapRow(ResultSet rs, int rowNum)
                    throws SQLException {
                return rs.getString(1);
            }
        },null);
        System.out.println("BIAOGUOWOCHULAILEWO");
        if(scenicThemeList.size()==0){
            System.out.println("scenicThemeList is NULL");
        }else{
            System.out.println("scenicThemeList is not NULL");
            System.out.println(scenicThemeList);
            for(int i=0;i<scenicThemeList.size();i++){
                System.out.println(scenicThemeList.get(i));
            }
        }
    }
}
