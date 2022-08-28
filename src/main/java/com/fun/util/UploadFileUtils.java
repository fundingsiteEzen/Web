package com.fun.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

//-----------------------------------------------------------------------------------------------------------
// 파일 올리기에 공통으로 사용할 메서드를 가진 클래스
//-----------------------------------------------------------------------------------------------------------
public class UploadFileUtils {

	// p_seq 값을 이미지 앞에 붙히고 저장
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		String savedName = originalName;
		
		// 업로드할 디렉토리를 생성한다.
		File target	= new File(uploadPath, savedName);
		
		// 임시 디렉토리에 업로드 후 지정 디렉토리에 복사
		FileCopyUtils.copy(fileData, target);
		
		System.out.println("작업 완료된 값 : " + savedName);
		return savedName;
		
	}
	
} // End - public class UploadFileUtils













