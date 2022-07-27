package com.salguMarket.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.salguMarket.category.model.CategoryVO;
import com.salguMarket.db.ConnectionPoolMgr2;

public class Utility {
	// 파일 업로드 관련 상수
	public static final String UPLOAD_PATH = "pds_upload";
	public static final String TEST_PATH = "notice_upload";

	public static List<CategoryVO> selectCategory(String second) throws SQLException { // 카테고리로 조회
		ConnectionPoolMgr2 pool = new ConnectionPoolMgr2();

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<CategoryVO> list = new ArrayList<CategoryVO>();
		try {
			// 1,2
			con = pool.getConnection();

			//
			String sql = "select * from category";

			if (second.length() > 0)
				sql += " where cNoRef=?";

			else
				sql += " where cNoRef is null";
			ps = con.prepareStatement(sql);

			if (second.length() > 0)
				ps.setString(1, second);
			System.out.println("sql=" + sql);
			// 4
			rs = ps.executeQuery();
			while (rs.next()) {
				String cCode = rs.getString("cCode");
				String cName = rs.getString("cName");
				String cNoRef = rs.getString("cNoRef");
				CategoryVO vo = new CategoryVO(cName, cCode, cNoRef);

				list.add(vo);
			}

			System.out.println("카테고리 조회 결과 list.size=" + list.size() + ", 매개변수 second=" + second);

			return list;
		} finally {
			pool.dbClose(rs, ps, con);
		}
	}

	// 상품 판매글 업데이트 시간 계산 메서드
	public static String diffOfDate(Date regdate) throws Exception {
		Date now = new Date();
		long diffDays;
		String result = "";

		long diff = now.getTime() - regdate.getTime();
		diff = diff / 1000; // 초 단위

		if (86400 < diff) {
			diffDays = diff / (24 * 60 * 60);
			result = diffDays + "일 전";
		} else if (86400 > diff && diff >= 3600) {
			diffDays = diff / (60 * 60);
			result = diffDays + "시간 전";
		} else if (60 <= diff && diff < 3600) {
			diffDays = diff / (60);
			result = diffDays + "분 전";
		} else if (60 > diff) {
			result = diff + "초 전";
		}
		return result;
	}

	// 상품제목, 설명 한줄 넘어갈 시 + (..) 붙이고 생략 메서드
	public static String cutString(String pTitle, int len) {
		String result = "";
		if (pTitle.length() > len) {
			result = pTitle.substring(0, len) + "..";
		} else {
			result = pTitle;
		}

		return result;
	}

	public static String displayRe(int step) {
		String result = "";
		if (step > 0) {
			for (int j = 0; j < step; j++) {
				result += "&nbsp;";
			}
			/* result+="<img src='../images/re.gif'>"; */
		}
		return result;
	}

	/*
	 * public static String cutString(String title, int len) { String result="";
	 * if(title.length()>len) { result=title.substring(0, len)+"..."; }else {
	 * result=title; } return result; }
	 */

	public static String displayNew(Date regdate) {
		String result = "";
		Date today = new Date();

		long time = (today.getTime() - regdate.getTime()) / 1000;
		time = time / (60 * 60);

		if (time < 24) {
			/* result="<img src='../images/new.gif'>"; */
		}
		return result;
	}

	public static String displayFile(String filename) {
		String result = "";
		if (filename != null && !filename.isEmpty()) {
			result = "<img src='../images/file.gif'>";
		}
		return result;
	}
	/*
	 * public static String getFileInfo(ReBoardVO vo) { String result="";
	 * if(vo.getFileName()!=null && !vo.getFileName().isEmpty()) {
	 * result="<img src='../images/file.gif'>" + " "+vo.getFileName() +
	 * "("+(vo.getFileSize()/1024)+"KB) 다운 :" + vo.getDownCount(); } return result;
	 * }
	 */

	public static String getFileInfo(String filename, long filesize) {
		String result = "";

		if (filename != null && !filename.isEmpty()) {
			double fsize = filesize / 1024.0;

			result += displayFile(filename) + " ";
			result += filename;
			result += " (" + Math.round(fsize * 100) / 100.0 + "KB)";
		}

		return result;
	}
}
