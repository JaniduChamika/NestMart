package com.jiat.nestmart.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author Achintha
 */
public class FileUploadUtil {

    private static String UPLOAD_DIR = "upload";

    private static final int MAX_FILE_SIZE = 1024 * 1024 * 100; // 100MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 1000; // 1GB

    public FileUploadUtil(String saveDerectoryName) {
        UPLOAD_DIR = "upload/" + saveDerectoryName;
    }

    public FileUploadUtil() {

    }

    public List<FileItem> upload(HttpServletRequest request) {
        if (ServletFileUpload.isMultipartContent(request)) {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setSizeMax(MAX_REQUEST_SIZE);
            upload.setFileSizeMax(MAX_FILE_SIZE);

            ServletContext context = request.getServletContext();

            String uploadPath = context.getRealPath("") + File.separator + UPLOAD_DIR;

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                System.out.println("Uploading directory not found, creating directory: " + uploadPath);
                uploadDir.mkdir();
            }

            List<FileItem> items = new ArrayList<>();
            try {
                List<org.apache.commons.fileupload.FileItem> fileItems = upload.parseRequest(request);
                fileItems.forEach(fi -> {
                    if (!fi.isFormField()) {
                        String extension = FilenameUtils.getExtension(fi.getName());
                        String fileName = System.currentTimeMillis() + "." + extension;

                        String filePath = uploadPath + File.separator + fileName;

                        try {
                            fi.write(new File(filePath));
                            System.out.println("File Upload successfully : " + filePath);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                        String fileUrl = context.getContextPath() + "/" + UPLOAD_DIR + "/" + fileName;

                        String fullUrl = String.format("http://%s:%s%s", "localhost", 8080, fileUrl);

                        items.add(new FileItem(fileName, fi.getName(), fileUrl, fullUrl));
                    }
                    try {
                        Thread.sleep(100);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(FileUploadUtil.class.getName()).log(Level.SEVERE, null, ex);
                    }
                });

                return items;

            } catch (FileUploadException ex) {
                Logger.getLogger(FileUploadUtil.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
        return null;
    }

    public static class FileItem {

        private String fileName;
        private String fileNameOriginal;
        private String path;
        private String url;

        public FileItem(String fileName, String fileNameOriginal, String path, String url) {
            this.fileName = fileName;
            this.fileNameOriginal = fileNameOriginal;
            this.path = path;
            this.url = url;
        }

        public String getFileName() {
            return fileName;
        }

        public void setFileName(String fileName) {
            this.fileName = fileName;
        }

        public String getFileNameOriginal() {
            return fileNameOriginal;
        }

        public void setFileNameOriginal(String fileNameOriginal) {
            this.fileNameOriginal = fileNameOriginal;
        }

        public String getPath() {
            return path;
        }

        public void setPath(String path) {
            this.path = path;
        }

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }

    }
}
