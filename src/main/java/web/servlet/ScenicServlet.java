package web.servlet;

import dao.impl.ScenicInfoDaoImpl;
import dao.impl.UserInfoDaoImpl;
import domain.PageBean;
import domain.ScenicCommentInfo;
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
        if("findScenicInfoByScenicId".equals(methodName)){
            findScenicInfoByScenicId(request,response);
            queryScenicCommentPage(request,response);
            request.getRequestDispatcher("/ztl/ScenicInfo.jsp").forward(request,response);
        }
//        if("findScenicInfo")

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

        //主题列表
        List<String> scenicThemeList = null;
        scenicThemeList = scenicInfoService.queryScenicTheme();
        request.removeAttribute("scenicThemeList");
        request.setAttribute("scenicThemeList",scenicThemeList);
        //页面
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        PageBean<ScenicInfo> scenicPageBean = scenicInfoService.queryScenicInfoPage(currentPage,rows);
        request.setAttribute("scenicPageBean",scenicPageBean);

        request.getRequestDispatcher("/ztl/SearchScenic.jsp").forward(request,response);

    }

    private void queryScenicInfoPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        PageBean<ScenicInfo> scenicPageBean = scenicInfoService.queryScenicInfoPage(currentPage,rows);
        request.setAttribute("scenicPageBean",scenicPageBean);
        request.getRequestDispatcher("/college_list.jsp").forward(request,response);

    }

    private void queryScenicCommentPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //页面
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        String scenicId = request.getParameter("scenicId");
        //查出这一页的景点评论
        PageBean<ScenicCommentInfo> scenicCommentPageBean = scenicInfoService.queryScenicComment(scenicId, currentPage, rows);
        //查出这一页评论的所有子评论
        List<ScenicCommentInfo> scenicCommentChild = scenicInfoService.queryScenicCommentChild(scenicId, currentPage, rows);
        //查出这一页所有评论的用户的头像
        Map<Integer,String> userName = scenicInfoService.queryScenicCommentUserName(scenicId,currentPage,rows);

        request.setAttribute("scenicCommentPageBean",scenicCommentPageBean);
        request.setAttribute("scenicCommentChild",scenicCommentChild);

    }

    private void findScenicInfoByScenicId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        String userIdStr = request.getParameter("userId");
        String scenicId = request.getParameter("scenicId");
        ScenicInfo scenicInfo;
        scenicInfo = scenicInfoService.findScenicInfoByScenicId(scenicId);
        //景点信息
        request.setAttribute("scenicInfo",scenicInfo);
    }


    private void pageTest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{


        System.out.println("进入了pageTest");
        PageBean<ScenicInfo> scenicPageBean = scenicInfoService.queryScenicInfoPage("1","10");
        request.setAttribute("scenicPageBean",scenicPageBean);
        request.getRequestDispatcher("/college_list.jsp").forward(request,response);

    }



    public static void main(String[] args) {
        ScenicInfoService scenicInfoService = new ScenicInfoServiceImpl(new ScenicInfoDaoImpl());
        PageBean<ScenicInfo> scenicPageBean = scenicInfoService.queryScenicInfoPage("1","10");
        System.out.println(scenicPageBean);

    }

}
