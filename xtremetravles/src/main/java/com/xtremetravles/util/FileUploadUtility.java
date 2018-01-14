package com.xtremetravles.util;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtility {


	private static final String ADDRESS_ABS_PATH = "D:\\Prem\\project\\workspace\\xtreme-travles\\xtremetravles\\src\\main\\webapp\\assets\\images\\address\\";
	private static String ADDRESS_REAL_PATH = null;
	
	private static final String PAN_ABS_PATH = "D:\\Prem\\project\\workspace\\xtreme-travles\\xtremetravles\\src\\main\\webapp\\assets\\images\\pan\\";
	private static String PAN_REAL_PATH = null;
	
	public static boolean uploadAddressProof(HttpServletRequest request, MultipartFile addressProof, String code) {


		ADDRESS_REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/address/");
		System.out.println(ADDRESS_REAL_PATH);
		// create the directories if it does not exist
		
		if(!new File(ADDRESS_REAL_PATH).exists()) {
			new File(ADDRESS_REAL_PATH).mkdirs();
		}
		
		if(!new File(ADDRESS_ABS_PATH).exists()) {
			new File(ADDRESS_ABS_PATH).mkdirs();
		}
		
		try {
			//transfer the file to both the location
			addressProof.transferTo(new File(ADDRESS_REAL_PATH + code + ".jpg"));
			addressProof.transferTo(new File(ADDRESS_ABS_PATH + code + ".jpg"));
		}
		catch(IOException ex) {
			ex.printStackTrace();
		}
		return true;
	}

	public static boolean uploadPanCardProof(HttpServletRequest request, MultipartFile panCardProof, String code) {
		
		PAN_REAL_PATH = request.getSession().getServletContext().getRealPath("/assets/images/pan/");
		
		// create the directories if it does not exist
		System.out.println(PAN_REAL_PATH);

		if(!new File(PAN_REAL_PATH).exists()) {
			new File(PAN_REAL_PATH).mkdirs();
		}
		
		if(!new File(PAN_ABS_PATH).exists()) {
			new File(PAN_ABS_PATH).mkdirs();
		}
		
		try {
			//transfer the file to both the location
			panCardProof.transferTo(new File(PAN_REAL_PATH + code + ".jpg"));
			panCardProof.transferTo(new File(PAN_ABS_PATH + code + ".jpg"));
		}
		catch(IOException ex) {
			ex.printStackTrace();
		}
		return true;
	}
}
