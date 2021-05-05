package utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Create By Intellij idea
 * Author:Macro
 * Date:2021/5/5
 * Time:15:20
 * Describe:
 */

public class FileUtils {
    public static void transferFile(String sourceFilePath, String targetFilePath) throws IOException {
//获取要复制的文件
        File oldfile=new File(sourceFilePath);
//文件输入流，用于读取要复制的文件
        FileInputStream fileInputStream = new FileInputStream(oldfile);
//要生成的新文件（指定路径如果没有则创建）
        File newfile=new File(targetFilePath);
//获取父目录
        File fileParent = newfile.getParentFile();
        System.out.println(fileParent);
//判断是否存在
        if (!fileParent.exists()) {
// 创建父目录文件夹
            fileParent.mkdirs();
        }
//判断文件是否存在
        if (!newfile.exists()) {
//创建文件
            newfile.createNewFile();
        }

//新文件输出流
        FileOutputStream fileOutputStream = new FileOutputStream (newfile);
        byte[] buffer= new byte[1024];
        int len;
//将文件流信息读取文件缓存区，如果读取结果不为-1就代表文件没有读取完毕，反之已经读取完毕
        while ((len=fileInputStream.read(buffer))!=-1) {
            fileOutputStream.write(buffer, 0, len);
            fileOutputStream.flush();
        }
        fileInputStream.close();
        fileOutputStream.close();

    }

    public static void main(String[] args) throws IOException {
        FileUtils.transferFile("E:\\计算机学习\\自己\\本科\\毕设\\程序\\图片\\FreegoImg\\scenic_default.jpg","E:\\计算机学习\\自己\\本科\\毕设\\程序\\图片\\FreegoImg\\ztl\\scenic_default2.jpg");
    }
}
