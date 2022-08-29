package com.fun.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

// 이미지 올리기
public class UploadFileUtils {
	
	// 슬라이드 이미지에 저장
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		String savedName = originalName;
		
		// 업로드할 디렉토리를 생성한다.
		File target	= new File(uploadPath, savedName);
		
		// 임시 디렉토리에 업로드 후 지정 디렉토리에 복사
		FileCopyUtils.copy(fileData, target);
		
		System.out.println("작업 완료된 값 : " + savedName);
		return savedName;
		
	}
	
	// 썸네일 이미지에 저장
	public static String uploadThumbFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		
		String savedName = originalName;
		
		// 업로드할 디렉토리를 생성한다.
		File target	= new File(uploadPath, savedName);
		
		// 임시 디렉토리에 업로드 후 지정 디렉토리에 복사
		FileCopyUtils.copy(fileData, target);
		
		// 이미지 사이즈를 줄여서 저장함
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, savedName));
		BufferedImage destImg	= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 300);
		ImageIO.write(destImg, savedName, target);
		
		System.out.println("작업 완료된 값 : " + savedName);
		return savedName;
		
	}
	
}













