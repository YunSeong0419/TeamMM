package com.mealmaker.babiyo.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "C:\\upload";
	
	public List<Map<String, Object>> parseInsertFileInfo(int parentSeq
		, MultipartHttpServletRequest multipartHttpServletRequest) 
			throws Exception{
		
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		MultipartFile multipartFile = null;
		// intro.txt -> 
		
		String originalFileName = null;  // intro
		String originalFileExtension = null; // txt
		String storedFileName = null; // 중복되지 않도록 이름 만듬
		
		List<Map<String, Object>> fileList = 
			new ArrayList<Map<String, Object>>();
		//db에 실제 저장할 내용
		Map<String, Object> fileInfoMap = null;
		
		File file = new File(filePath);
		
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile 
				= multipartHttpServletRequest.getFile(iterator.next());
			
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(
					originalFileName.lastIndexOf("."));
				storedFileName = CommonUtils.getRandomString() 
						+ originalFileExtension;
				
				
				file = new File(filePath, storedFileName);
				multipartFile.transferTo(file);
				
				fileInfoMap = new HashMap<String, Object>();
				fileInfoMap.put("parentSeq", parentSeq);
				fileInfoMap.put("original_file_name", originalFileName);
				fileInfoMap.put("stored_file_name", storedFileName);
				fileInfoMap.put("file_size", multipartFile.getSize());
				
				fileList.add(fileInfoMap);
			}
			
		}
		
		return fileList;
	}
	
	// 기존의 파일이 존재하는데 새로운 파일로 변경되는 경우
	public void parseUpdateFileInfo(Map<String, Object> tempFileMap)
		throws Exception{
//		ctrl+alt+h: call 메서드 찾아감

		String storedFileName = (String)tempFileMap.get("STORED_NAME");
		// 여기서 부터 설명해주자 
		File file = new File(filePath + "/" + storedFileName);
		
		// 파일을 만드는게 아닌 주소만 불러옴
		
		if(file.exists()) {
			file.delete();
		}else {
			System.out.println("파일이 존재하지 않습니다.");
		}
	}
}
