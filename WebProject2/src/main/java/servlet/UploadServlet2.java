package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/UploadServlet2")
public class UploadServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		// 파일 저장 경로 설정 : upload
		String path = application.getRealPath("upload");
		System.out.println("설정한 파일 저장 경로 : " + path);
		
		//upload 폴더 없으면 새로 만들기
		File filePath = new File(path);
		if(!filePath.exists()) {
			filePath.mkdirs();
		}
		
		int fileLimit = 100*1024*1024; // 100mb

		MultipartRequest multi = new MultipartRequest(
								 request, // 요청객체
								 path, // 팡리 저장 경로
								 fileLimit, // 파일 최대 크기
								 "UTF-8", // 파일이름 한글깨짐 방지
								 new DefaultFileRenamePolicy() // 파일 rename 정책
								 ); // MultipartRequest 객체가 생성될때 파일 저장 완료

		// 이제 저장된 파일에 대한 정보를 MultipartRequest 객체로부터 뽐아냄
		Enumeration<?> files = multi.getFileNames();
		String fileObject = (String)files.nextElement();
		String fileName = multi.getFilesystemName(fileObject); // 파일 이름
//		long fileSize = multi.getFile(fileObject).length(); // 파일 용량크기
		String description = multi.getParameter("desc"); // 파일 설명

		request.setAttribute("fileName", fileName);
//		request.setAttribute("fileSize", fileSize);
		request.setAttribute("desc", description);

		System.out.println("Attribute 에 담기 완료");

		request.getRequestDispatcher("ExUploadResult2.jsp").forward(request, response);
	}
}
