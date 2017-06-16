    package com.ysnc.shopping.servlet;  
      
    import java.io.File;  
    import java.io.IOException;  
    import java.io.PrintWriter;  
    import java.util.ArrayList;  
    import java.util.Iterator;  
    import java.util.List;  
      
    import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;  
    import javax.servlet.http.HttpServlet;  
    import javax.servlet.http.HttpServletRequest;  
    import javax.servlet.http.HttpServletResponse;  
      
    import org.apache.commons.fileupload.DiskFileUpload;  
    import org.apache.commons.fileupload.FileItem;  
    import org.apache.commons.fileupload.FileItemFactory;  
    import org.apache.commons.fileupload.disk.DiskFileItemFactory;  
    import org.apache.commons.fileupload.servlet.ServletFileUpload;  
      
    public class FileUpload extends HttpServlet {  
    	
        public void doGet(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
            doPost(request, response);  
        }  
      
        public void doPost(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
            request.setCharacterEncoding("UTF-8");  
            // 构建上传路径  
            int id = -1;
            String basePath = "E:\\Python_workspace\\Shopping\\WebContent\\imgs\\products\\";  
            System.out.println("path=" + basePath);  
      
            // 文件上傳部分  
            boolean isMultipart = ServletFileUpload.isMultipartContent(request);  
      
            if (isMultipart == true) {  
                try {  
                    FileItemFactory factory = new DiskFileItemFactory();  
                    ServletFileUpload upload = new ServletFileUpload(factory);  
      
                    // 得到所有的表单域，它们目前都被当作FileItem  
                    List<FileItem> fileItems = upload.parseRequest(request);  
                    Iterator<FileItem> iter = fileItems.iterator();  
      
                    // 依次处理每个表单域  
                    while (iter.hasNext()) {  
                        FileItem item = (FileItem) iter.next();  
                    	
      
                        if (item.isFormField()) {  
                        	if(item.getFieldName().equals("id")) {
        						id = Integer.parseInt(item.getString());
        					}
                        	
                        	// 如果item是正常的表单域  
                            String name = item.getFieldName();  
                            String value = item.getString();  
                            System.out.print("表单域名为:" + name + "表单域值为:" + value);  
                        } else {  
                            // 如果item是文件上传表单域  
      
                            // 获得文件名及路径  
                            String fileName = item.getName();  
                            System.out.println(fileName);  
                            if (fileName != null) {  
                                File fullFile = new File(item.getName());  
                                // 如果文件存在则上传  
                                if (fullFile.exists()) {  
                                    File fileOnServer = new File(basePath, id+".jpg");  
                                    item.write(fileOnServer);  
                                    
                                    
                                    System.out.println("文件"  
                                            + fileOnServer.getName() + "上传成功");  
                                }  
                            }  
                        }  
                    }  
                } catch (Exception e) {  
                    e.printStackTrace();  
                }  
            } else {  
                System.out.println("the enctype must be multipart/form-data");  
            }  
      
            // 取得服务器中已有文件的下載列表  
            List<String> fileListInServer = new ArrayList<String>();  
      
            File dir = new File(basePath);  
            String[] children = dir.list();  
            if (children != null) {  
                for (int i = 0; i < children.length; i++) {  
                    fileListInServer.add(children[i]);  
                }  
            }  
            request.setAttribute("downloadList", fileListInServer);  
      
            // 跳回原頁面  
            RequestDispatcher dispatcher = request  
                    .getRequestDispatcher("admin/产品管理/uploadOk.jsp");  
            dispatcher.forward(request, response);  
            return;  
      
        }  
      
    }  