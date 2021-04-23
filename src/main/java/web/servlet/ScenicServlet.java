package web.servlet;

import dao.impl.ScenicInfoDaoImpl;
import dao.impl.UserInfoDaoImpl;
import domain.PageBean;
import domain.ScenicInfo;
import domain.UserInfo;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import service.ScenicInfoService;
import service.impl.ScenicInfoServiceImpl;
import utils.JDBCUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

@WebServlet("/ScenicServlet")
public class ScenicServlet extends HttpServlet {
    ScenicInfoService scenicInfoService = new ScenicInfoServiceImpl(new ScenicInfoDaoImpl());
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        System.out.println("DOPOST");
        String methodName = request.getParameter("methodName");

        if("queryScenicIndex".equals(methodName)){
            queryScenicIndex(request,response);
        }
        if("findScenicInfo".equals(methodName)){
            test(request,response);
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        System.out.println("出来了");

        JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

        String sql = null;
        //1.定义sql语句
        sql = "select * from scenic where province = ? LIMIT 100;";
        //2.执行
        List<ScenicInfo> scenicInfoList = null;
        scenicInfoList = template.query(sql, new BeanPropertyRowMapper<ScenicInfo>(ScenicInfo.class), "北京");
        System.out.println("BIAOGUOWOCHULAILEWO");
        if(scenicInfoList.size()==0){
            System.out.println("ScenicInfo is NULL");
        }else{
            System.out.println("ScenicInfo is not NULL");
            System.out.println(scenicInfoList);
            for(int i=0;i<scenicInfoList.size();i++){
                System.out.println(scenicInfoList.get(i).toString());
            }
        }
        request.removeAttribute("scenicInfoList");
        request.setAttribute("scenicInfoList",scenicInfoList);


        request.getRequestDispatcher("/ztl/ScenicMain.jsp").forward(request,response);

    }

    private void queryScenicIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        System.out.println("在servlet里面");
        List<String> scenicThemeList = null;

        scenicThemeList = scenicInfoService.queryScenicTheme();
        System.out.println("Service");
        request.removeAttribute("scenicThemeList");
        request.setAttribute("scenicThemeList",scenicThemeList);
        System.out.println(scenicThemeList);
        request.getRequestDispatcher("/ztl/SearchScenic.jsp").forward(request,response);

    }


    private void queryScenicInfoPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        request.setCharacterEncoding("utf-8");
        PageBean pageBean = new PageBean();
        //获取总共页面
        String totalPageStr = request.getParameter("totalPage");
        // 默认获取第一页的数据
        if(totalPageStr == null || "".equals(totalPageStr)) {
            totalPageStr = "0";
        }
        int currentPage = Integer.parseInt(totalPageStr);
        //获取总共数量
        int totalCount = scenicInfoService
        // 获取当前页
        String currentPageStr = request.getParameter("currentPage");
        // 默认获取第一页的数据
        if(currentPageStr == null || "".equals(currentPageStr)) {
            currentPageStr = "0";
        }
        int currentPage = Integer.parseInt(currentPageStr);
        pageBean.setCurrentPage(currentPage);
        // 获取每页的容量
        String pageSizeStr = request.getParameter("pageSize");
        // 默认每页10个
        if(pageSizeStr == null || "".equals(pageSizeStr)) {
            pageSizeStr = "10";
        }
        int pageSize = Integer.parseInt(pageSizeStr);
        pageBean.setPageSize(pageSize);

        PageBean<ScenicInfo> pb = scenicInfoService.queryScenicInfoPage(currentPage,rows,condition);
        System.out.println(pb);
        request.setAttribute("pageColleges",pb);
        //3.将PageBean存入request
        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);//将查询条件存入request
        //4.转发到list.jsp
        request.getRequestDispatcher("/college_list.jsp").forward(request,response);

    }


    public static void main(String[] args) {
        ScenicInfoService scenicInfoService = new ScenicInfoServiceImpl(new ScenicInfoDaoImpl());
        System.out.println(scenicInfoService.queryScenicTheme());
    }

}
