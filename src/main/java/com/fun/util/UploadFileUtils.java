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
		
		String savedName = "user1_" + originalName; // 아이디 임시로 고정해놓음
		
		// 업로드할 디렉토리를 생성한다.
		File target	= new File(uploadPath, savedName);
		
		// 임시 디렉토리에 업로드 후 지정 디렉토리에 복사
		FileCopyUtils.copy(fileData, target);
		
		System.out.println("작업 완료된 값 : " + savedName);
		return savedName;
		
	}

	//-----------------------------------------------------------------------------------------------------------
	// 아이콘 생성하기
	//-----------------------------------------------------------------------------------------------------------
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		
		// 아이콘의 이름
		// File.separator(디렉토리 구분자) : 윈도우 \ ,  유닉스(리눅스) /
		String iconName = uploadPath + path + File.separator + fileName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	} // End - private static String makeIcon()
	
	//-----------------------------------------------------------------------------------------------------------
	// 썸네일 생성하기
	//-----------------------------------------------------------------------------------------------------------
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		// 이미지를 읽어서 버퍼에 저장한다.
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		// 100픽셀 단위의 쎔네일을 생성한다.
		// Scalr.resize : 원본 이미지보다 축소하기 위해서 사용한다.
		// 높이를 100픽셀로 맞추면 폭은 자동으로 맞춰진다.
		// Scalr.resize(source, scalingMethod, resizeMode, targetSize);
		BufferedImage destImg	= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
	
		// 썸네일 파일의 이름
		// s_이 붙으면 썸네일 파일, 아니면 원본 파일이다.
		String 	thumbnailName 	= uploadPath + path + File.separator + "s_" + fileName;
		
		File	newFile			= new File(thumbnailName);
		String	extensionName	= fileName.substring(fileName.lastIndexOf(".") + 1);
		
		// 썸네일 파일을 생성한다.
		ImageIO.write(destImg, extensionName.toUpperCase(), newFile);
		
		// 썸네일 파일 이름을 리턴한다.
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		
	} // End - private static String makeThumbnail(String uploadPath, String path, String fileName)
	
	//-----------------------------------------------------------------------------------------------------------
	// 경로를 계산하여 만드는 메서드
	// DeciamlFormat("00") : 10 보다 작은 경우 자리수를 맞추기 위해서 사용하는 메서드
	//-----------------------------------------------------------------------------------------------------------
	private static String calculatePath(String uploadPath) {
		
		// 년월일 정보를 얻기 위해서 캘린터의 인스턴스를 가져온다.
		Calendar cal = Calendar.getInstance();
		
		// 년도를 구해서 변수에 저장한다.
		String 	yearPath	= File.separator + cal.get(Calendar.YEAR);
		
		// 월을 구해서 변수에 저장한다.
		String 	monthPath	= yearPath  + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		
		// 일을 구해서 변수에 저장한다.
		String	datePath	= monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		// 년월일에 맞게 디렉토리를 생성한다.
		makeDir(uploadPath, yearPath, monthPath, datePath);
		System.out.println("Date경로 : " + datePath);
		
		// 일경로를 리턴한다.
		return datePath;
		
	} // End - private static String calculatePath(String uploadPath)
	
	//-----------------------------------------------------------------------------------------------------------
	// 디렉토리를 만드는 메서드
	// 가변 사이즈 매개 변수 마침표 3개(...)
	// String ... 에 uploadPath
	// paths[0] 에 yearPath
	// paths[1] 에 monthPath
	// paths[2] 에 datePath 가 들어온다.
	//-----------------------------------------------------------------------------------------------------------
	private static void makeDir(String uploadPath, String ...  paths) {
		
		// 디렉토리가 이미 존재한다면 만들지 않고 통과한다.
		if(new File(paths[paths.length -1]).exists()) {
			return;
		}
		// paths에 있는 모든 정보(년경로, 월경로, 일경로) 만큼 반복을 한다.
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			if(!dirPath.exists()) {	// 디렉토리가 존재하지 않는 경우에만
				dirPath.mkdir();	// 디렉토리를 생성한다.
			}
		}
		
	} // End - private static void makeDir(String uploadPath, String ...  paths)
	
} // End - public class UploadFileUtils













