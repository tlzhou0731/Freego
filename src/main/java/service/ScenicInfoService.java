package service;

import domain.PageBean;
import domain.ScenicInfo;

import java.util.List;
import java.util.Map;

/**
 * @Author: Macro
 * @Date: 2021/4/17 13:34
 * @Description:
 */

public interface ScenicInfoService {
    public List<String> queryScenicTheme();

    public PageBean<ScenicInfo> queryScenicInfoPage(PageBean<ScenicInfo> pBean, String cid);

}
