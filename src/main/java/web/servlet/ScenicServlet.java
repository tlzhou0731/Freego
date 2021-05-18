package web.servlet;

import com.sun.deploy.net.HttpRequest;
import dao.impl.ScenicInfoDaoImpl;
import dao.impl.UserInfoDaoImpl;
import domain.*;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
        String methodName = request.getParameter("methodName");
        //进景点主界面
        if("queryScenicIndex".equals(methodName)){
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
            queryTicketInfo(request, response);
            request.getRequestDispatcher("/ztl/ScenicInfo.jsp").forward(request,response);
        }
        //进入评价景点界面
        if("commentScenic".equals(methodName)){
            commentScenic(request,response);
            request.getRequestDispatcher("/ztl/CommentScenic.jsp").forward(request,response);
        }
        //从评价景点界面返回景点信息界面
        if("addScenicComment".equals(methodName)){
            addScenicComment(request,response);
            queryScenicCommentPage(request,response);
            request.getRequestDispatcher("/ztl/ScenicInfo.jsp").forward(request,response);
        }
        //进入门票信息界面
        if("queryTicketInfo".equals(methodName)){
            queryTicketDatePrice(request, response);
            request.getRequestDispatcher("/ztl/TicketInfo.jsp").forward(request,response);        }
        //从门票界面返回景点信息界面
        if("addTicketOrder".equals(methodName)){
            addTicketOrder(request,response);
            System.out.println("ORDERFLAGYES");
            request.getSession().setAttribute("orderFlag","yes");
            request.getRequestDispatcher("/ztl/ScenicInfo.jsp").forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    private void queryScenicCommentPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //页面
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
//        String scenicId = request.getParameter("scenicId");
        String scenicId = (String)request.getSession().getAttribute("scenicId");
        //查出这一页的景点评论
        PageBean<ScenicCommentInfo> scenicCommentPageBean = scenicInfoService.queryScenicComment(scenicId, currentPage, rows);
        //查出这一页评论的所有子评论
        List<ScenicCommentInfo> scenicCommentChild = scenicInfoService.queryScenicCommentChild(scenicId, currentPage, rows);
        //查出这一页所有评论的用户的头像
        Map<Integer,String> userName = scenicInfoService.queryScenicCommentUserName(scenicId,currentPage,rows);

        request.getSession().setAttribute("scenicCommentPageBean",scenicCommentPageBean);
        request.getSession().setAttribute("scenicCommentChild",scenicCommentChild);

    }

    private void findScenicInfoByScenicId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String scenicId = request.getParameter("scenicId");
        ScenicInfo scenicInfo;
        scenicInfo = scenicInfoService.findScenicInfoByScenicId(scenicId);
        //景点信息
        request.getSession().setAttribute("scenicInfo",scenicInfo);
        request.getSession().setAttribute("scenicId",String.valueOf(scenicInfo.getScenicId()));
    }
    private void queryScenicNearByScenicId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//        String scenicId = request.getParameter("scenicId");
        String scenicId = (String)request.getSession().getAttribute("scenicId");
        List<ScenicInfo> scenicInfoList;
        scenicInfoList = scenicInfoService.queryScenicNearByScenicId(scenicId);
        System.out.println("NEAR SCENICINFO");
        System.out.println(scenicInfoList);
        //景点信息
        request.getSession().setAttribute("nearScenicList",scenicInfoList);
    }

    private void queryRecommendScenicAndTag(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String userIdStr = (String)request.getSession().getAttribute("userId");
        //地点列表
        List<String> downtownInlandList = scenicInfoService.queryDowntownInland();
        List<String> downtownAbroadList = scenicInfoService.queryDowntownAbroad();
        //主题列表
        Map<Integer,String> totalTag = scenicInfoService.queryScenicTag();
        //推荐景点map
        Map<Integer,List<ScenicInfo>> recommendTagScenic = scenicInfoService.querySimilarScenic(userIdStr);
        //页面景点列表
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        PageBean<ScenicInfo> scenicPageBean = scenicInfoService.queryScenicInfoPage(currentPage,rows);

        request.setAttribute("downtownInlandList",downtownInlandList);
        request.setAttribute("downtownAbroadList",downtownAbroadList);
        request.setAttribute("scenicPageBean",scenicPageBean);
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

    private void commentScenic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String parentIdStr = request.getParameter("parentId");
        String parentCommentIdStr = request.getParameter("parentCommentId");
        int parentId = Integer.parseInt(parentIdStr);
        int parentCommentId = Integer.parseInt(parentCommentIdStr);
        request.setAttribute("parentId",parentId);
        request.setAttribute("parentCommentId",parentCommentId);
    }

    private void addScenicComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String scenicIdStr = (String)request.getSession().getAttribute("scenicId");
        String userIdStr = (String)request.getSession().getAttribute("userId");
        String parentIdStr = request.getParameter("parentId");
        String parentCommentIdStr = request.getParameter("parentCommentId");
        String scenicStarStr = request.getParameter("scenicStar");

        String commentText = request.getParameter("commentText");
        String[] commentPictures = request.getParameterValues("commentPictures");
        List<String> commentPictureList = new ArrayList<String>();
        if(commentPictures==null){
            commentPictureList = null;
        }else{
            for(int i = 0;i<commentPictures.length;i++){
                commentPictureList.add(commentPictures[i]);
            }
            System.out.println(commentPictureList);
        }
        commentPictureList=null;
        scenicInfoService.commentScenic(parentIdStr,parentCommentIdStr,userIdStr,scenicIdStr,scenicStarStr,commentText,"0",commentPictureList);

    }

    private void queryTicketInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String scenicIdStr = (String)request.getSession().getAttribute("scenicId");
        int scenicId = Integer.parseInt(scenicIdStr);
        List<TicketInfo> ticketInfoList = scenicInfoService.queryTicketInfo(scenicId);
        request.getSession().setAttribute("ticketInfoList",ticketInfoList);
    }
    private void queryTicketDatePrice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<TicketInfo> ticketInfoList = (List<TicketInfo>)request.getSession().getAttribute("ticketInfoList");
        List<TicketDatePrice> ticketDatePriceList = new ArrayList<TicketDatePrice>();
        for(TicketInfo ticketInfo:ticketInfoList){
            System.out.println("DATEPRICE-S");
            List<TicketDatePrice> ticketDatePriceList1 = scenicInfoService.queryTicketDatePrice(ticketInfo.getTicketId());
            System.out.println(ticketDatePriceList1);
            System.out.println("DATEPRICE-E");
            for(TicketDatePrice ticketDatePrice:ticketDatePriceList1){
                ticketDatePriceList.add(ticketDatePrice);
            }
        }
        request.getSession().setAttribute("ticketDatePriceList",ticketDatePriceList);
    }

    private void addTicketOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ticketIdStr = request.getParameter("ticketId");
        String dateStr = request.getParameter("ticketDate");
        String ticketPriceStr = request.getParameter("ticketPrice");
        String ticketNumStr = request.getParameter("ticketNum");
        String orderRemark = request.getParameter("orderRemark");
        String travelerName = request.getParameter("travelerName");
        String travelerTelephone = request.getParameter("travelerTelephone");
        String travelerIdCard = request.getParameter("travelerIdCard");
        String userIdStr = (String)request.getSession().getAttribute("userId");
        int userId = Integer.parseInt(userIdStr);
        int ticketPrice = Integer.parseInt(ticketPriceStr);
        int ticketNum = Integer.parseInt(ticketNumStr);
        int orderPrice = ticketNum*ticketPrice;
        int ticketId = Integer.parseInt(ticketIdStr);
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = simpleDateFormat.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        scenicInfoService.saveOrder(userId,ticketId,date,ticketPrice,ticketNum,orderPrice,orderRemark,travelerName,travelerTelephone,travelerIdCard);
    }
}
