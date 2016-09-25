package com.demo.server.common.fileupload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.demo.server.common.Config;


public class FileUpload {
	private static FileUpload fileUpload;
	
	public static FileUpload getInstance() {
    	if(null==fileUpload) {
    		fileUpload = new FileUpload();
    	}
    	return fileUpload;
    }

	public String upload(HttpServletRequest request, HttpServletResponse response, String folderName)  { 
        String fullFilePath = "";
		String fileRealPath = Config.getUploadPath()+folderName+"/";//文件存放真实地址  

        // 获得容器中上传文件夹所在的物理路径  
        File file = new File(fileRealPath);  
        if (!file.isDirectory()) {  
            file.mkdirs();  
        }  
        
        try {  
            DiskFileItemFactory fac = new DiskFileItemFactory();  
            ServletFileUpload upload = new ServletFileUpload(fac);  
            upload.setHeaderEncoding("UTF-8");  
            // 获取多个上传文件  
            List<FileItem> fileList = upload.parseRequest(request);  
            // 遍历上传文件写入磁盘  
            Iterator<FileItem> it = fileList.iterator(); 
            while (it.hasNext()) {  
            	FileItem item = it.next();
            	if(!item.isFormField()){
	                // 如果item是文件上传表单域     
	                // 获得文件名及路径     
	                String fileName = item.getName();  
	                if (fileName != null) {  
		                String last = fileName.substring(fileName.lastIndexOf("."), fileName.length());
		                Random random = new Random(1000000);
		                while(true) {
		                	 String tempPath = fileRealPath+Math.abs(random.nextInt())+last;//文件存放真实地址  
		                	 File _file = new File(tempPath);  
		                     if (!_file.isFile()) {  
		                    	 fullFilePath = tempPath;
		                    	 fileRealPath = tempPath;
		                         break; 
		                     } 
		                }
	                    BufferedInputStream in = new BufferedInputStream(item.getInputStream());// 获得文件输入流  
	                    BufferedOutputStream outStream = new BufferedOutputStream(new FileOutputStream(new File(fileRealPath)));// 获得文件输出流  
	                    Streams.copy(in, outStream, true);// 开始把文件写到你指定的上传文件夹  
	                    //上传成功，则插入数据库  
	                    if (!new File(fileRealPath).exists()) {  
	                          System.out.println("文件上传失败====>>"+fileName);
	                    } else {
	                    	System.out.println("成功上传=========>>>"+fileName);
	                    }
	                }   
            	} 
            }   
        } catch (org.apache.commons.fileupload.FileUploadException ex) {
    	   ex.printStackTrace();  
           System.out.println("没有上传文件");  
		} catch (IOException ex) {
			ex.printStackTrace(); 
		}
       return fullFilePath;
	}
}
