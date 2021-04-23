package dao;

import domain.PageBean;
import domain.ScenicInfo;

import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public interface ScenicInfoDao {
    List<String> selectScenicTheme() throws Exception;
    public int getTotalCount();
    List<ScenicInfo> selectScenicInfoPage(PageBean<ScenicInfo> pBean) throws Exception;

}
