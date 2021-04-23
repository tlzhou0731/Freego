package service.impl;

import dao.ScenicInfoDao;
import dao.impl.ScenicInfoDaoImpl;
import domain.PageBean;
import domain.ScenicInfo;
import service.ScenicInfoService;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public class ScenicInfoServiceImpl implements ScenicInfoService {
    private ScenicInfoDao scenicInfoDao;
    public ScenicInfoServiceImpl(ScenicInfoDao scenicInfoDao){
        this.scenicInfoDao = scenicInfoDao;
    }
    @Override
    public List<String> queryScenicTheme() {
        try {
            return scenicInfoDao.selectScenicTheme();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public PageBean<ScenicInfo> queryScenicInfoPage(PageBean<ScenicInfo> pBean, String cid){
        try {
            //查询总条数
            int totalCount=scenicInfoDao.getTotalCount();

            //查询当前页的数据
            List<ScenicInfo> scenicInfoList=scenicInfoDao.selectScenicInfoPage(pBean);

            PageBean<ScenicInfo> pBean2=new PageBean<ScenicInfo>();
            pBean2.setTotalCount(totalCount);
            pBean2.setList(scenicInfoList);
            pBean2.setCurrentPage(pBean.getCurrentPage());
            pBean2.setPageSize(pBean.getPageSize());
            return pBean2;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
