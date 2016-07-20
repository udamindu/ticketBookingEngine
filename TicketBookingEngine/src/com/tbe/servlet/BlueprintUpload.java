package com.tbe.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.tbe.controller.Configurations;
import com.tbe.controller.LocationPicturesController;
import com.tbe.controller.TableArrangementController;

/**
 * Servlet implementation class BlueprintUpload
 */
@WebServlet("/BlueprintUpload")
public class BlueprintUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Configurations config = new Configurations();
	
	private static final String UPLOAD_DIRECTORY = "upload";

	private static final int MEMORY_THRESHOLD 	= 1024 * 1024 * 3; 	// 3MB
	private static final int MAX_FILE_SIZE 		= 1024 * 1024 * 40; // 40MB
	private static final int MAX_REQUEST_SIZE	= 1024 * 1024 * 50; // 50MB

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		String filePath = null;
		
		if (!ServletFileUpload.isMultipartContent(request)) {
			PrintWriter writer = response.getWriter();
			writer.println("Error: Form must has enctype=multipart/form-data.");
			writer.flush();
			return;
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(MEMORY_THRESHOLD);
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);
		String uploadPath = "F:/GitProjects/TIcketBookingEngine/TicketBookingEngine/WebContent/data1/blueprints";

				
		
		// creates the directory if it does not exist
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}

		try {
			@SuppressWarnings("unchecked")
			List<FileItem> formItems = upload.parseRequest(request);

			if (formItems != null && formItems.size() > 0) {
				for (FileItem item : formItems) {

					if (!item.isFormField()) {
						String fileName = new File(item.getName()).getName();
						filePath = uploadPath + File.separator + fileName;
						File storeFile = new File(filePath);
						item.write(storeFile);
						request.setAttribute("message","Upload has been done successfully!");
					}
				}
			}
		} catch (Exception ex) {
			request.setAttribute("message","There was an error: " + ex.getMessage());
		}

		TableArrangementController ctrl = new TableArrangementController();
		String path = filePath.substring(filePath.indexOf("/data1"),filePath.length());
		path = path.replace("\\" , "/");
		boolean isSuccess = ctrl.addBlueprint("1", path);
	}
}
