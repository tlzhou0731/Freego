package alrithmetic;

import java.util.ArrayList;
import java.util.List;

/**
 * Create By Intellij idea
 * Author:Macro
 * Date:2021/5/10
 * Time:11:16
 * Describe:
 */

public class Match {

    public static int[] KMPNext(String matchStr){
        int[] next = new int[matchStr.length()];
        next[0] = 0;

        for(int i = 1,j = 0; i < matchStr.length(); i++){
            while(j > 0 && matchStr.charAt(j) != matchStr.charAt(i)){
                j = next[j - 1];
            }
            if(matchStr.charAt(i) == matchStr.charAt(j)){
                j++;
            }
            next[i] = j;
        }
        return next;
    }


    public static int KMPMatch(String originalStr, String matchStr){
        //1.首先计算出部分匹配表
        int[] next = KMPNext(matchStr);
        //2.查找匹配位置
        for(int i = 0, j = 0; i < originalStr.length(); i++){
            while(j > 0 && originalStr.charAt(i) != matchStr.charAt(j)){
                j = next[j-1];
            }
            if(originalStr.charAt(i) == matchStr.charAt(j)){
                j++;
            }
            if(j == matchStr.length()){
                return i-j+1;
            }
        }
        return -1;
    }

    public static int isLegal(String originnalStr){
        List<String> sensitiveWordList = new ArrayList<String>();
        int result = -1;
        sensitiveWordList.add("周天乐");
        sensitiveWordList.add("上路哥哥");
        sensitiveWordList.add("中路哥哥");
        sensitiveWordList.add("下路哥哥");
        sensitiveWordList.add("上路姐姐");
        sensitiveWordList.add("下路姐姐");
        sensitiveWordList.add("中路姐姐");
        sensitiveWordList.add("敏感词");
        for(int i = 0;i < sensitiveWordList.size();i++){
            result = KMPMatch(originnalStr,sensitiveWordList.get(i));
            if(result!=-1){
                return result;
            }
        }
        return -1;
    }
}
