package web.servlet;

import com.sun.deploy.net.HttpRequest;
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
import java.util.*;

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
        System.out.println("DDDDDOOOOOOOPPPPPPPPPPOOOOOOOOOOSSSSSSSSTTTTTTTTT");
        String methodName = request.getParameter("methodName");
        System.out.println(methodName);

        //进景点主界面
        if("queryScenicIndex".equals(methodName)){
            queryScenicIndex(request,response);
            queryRecommendScenicAndTag(request,response);
            request.getRequestDispatcher("/ztl/ScenicMain.jsp").forward(request,response);
        }
        //进景点搜索界面
        if("queryScenicBySearch".equals(methodName)){
            queryScenicBySearch(request,response);
            request.getRequestDispatcher("/ztl/SearchScenic.jsp").forward(request,response);
        }
        //进入景点信息界面
        if("findScenicInfoByScenicId".equals(methodName)){
            findScenicInfoByScenicId(request,response);
            queryScenicCommentPage(request,response);
            queryScenicNearByScenicId(request,response);
            request.getRequestDispatcher("/ztl/ScenicInfo.jsp").forward(request,response);
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
        //地点列表
        List<String> downtownInlandList = scenicInfoService.queryDowntownInland();
        List<String> downtownAbroadList = scenicInfoService.queryDowntownAbroad();
        request.setAttribute("downtownInlandList",downtownInlandList);
        request.setAttribute("downtownAbroadList",downtownAbroadList);
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
    private void queryScenicNearByScenicId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        String userIdStr = request.getParameter("userId");
        String scenicId = request.getParameter("scenicId");
        List<ScenicInfo> scenicInfoList;
        scenicInfoList = scenicInfoService.queryScenicNearByScenicId(scenicId);
        System.out.println("NEAR SCENICINFO");
        System.out.println(scenicInfoList);
        //景点信息
        request.setAttribute("nearScenicList",scenicInfoList);
    }

    private void queryRecommendScenicAndTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String userIdStr = request.getParameter("userId");
        Map<Integer,List<ScenicInfo>> recommendTagScenic = scenicInfoService.querySimilarScenic(userIdStr);
        Map<Integer,String> totalTag = scenicInfoService.queryScenicTag();
        request.setAttribute("totalTag",totalTag);
        request.setAttribute("recommendTagScenic",recommendTagScenic);
    }

    private void queryScenicBySearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        String[] travelMonth,travelAddr,travelTag;
        travelMonth = request.getParameterValues("dateChoose");
        travelAddr = request.getParameterValues("addrChoose");
        travelTag = request.getParameterValues("tagChoose");
        List<Integer> travelMonthList = new ArrayList<Integer>();
        List<String> travelAddrList = new ArrayList<String>();
        List<Integer> travelTagList = new ArrayList<Integer>();
        if(travelMonth==null){
            travelMonthList = null;
            travelMonthList = (List<Integer>)request.getSession().getAttribute("dateChoose");
        }else{
            for(int i = 0;i<travelMonth.length;i++){
                travelMonthList.add(Integer.parseInt(travelMonth[i]));
            }
            System.out.println(travelMonthList);
        }

        if(travelAddr==null){
            travelAddrList=null;
            travelAddrList = (List<String>)request.getSession().getAttribute("addrChoose");
        }else{
            for(int i = 0;i<travelAddr.length;i++){
                travelAddrList.add(travelAddr[i]);
            }
            System.out.println(travelAddrList);
        }
        if(travelTag==null){
            travelTagList = null;
            travelTagList = (List<Integer>)request.getSession().getAttribute("tagChoose");
        }else{
            for(int i = 0;i<travelTag.length;i++){
                travelTagList.add(Integer.parseInt(travelTag[i]));
            }
            System.out.println(travelTagList);
        }

        PageBean<ScenicInfo> searchScenicPageBean = scenicInfoService.queryScenicBySearch(travelMonthList,travelAddrList,travelTagList,currentPageStr,rows);
        request.setAttribute("searchScenicPageBean",searchScenicPageBean);
        request.setAttribute("travelMonthList",travelMonthList);
        request.setAttribute("travelAddrList",travelAddrList);
        request.setAttribute("travelTagList",travelTagList);
        Map<Integer,String> totalTag = scenicInfoService.queryScenicTag();
        request.setAttribute("totalTag",totalTag);
        List<String> downtownInlandList = scenicInfoService.queryDowntownInland();
        List<String> downtownAbroadList = scenicInfoService.queryDowntownAbroad();
        request.setAttribute("downtownInlandList",downtownInlandList);
        request.setAttribute("downtownAbroadList",downtownAbroadList);

    }






    public static void main(String[] args) {
        ScenicInfoService scenicInfoService = new ScenicInfoServiceImpl(new ScenicInfoDaoImpl());
        PageBean<ScenicInfo> scenicPageBean = scenicInfoService.queryScenicInfoPage("1","10");
        System.out.println(scenicPageBean);

    }

}
