package com.cndsalon.domain.shop;

import lombok.Data;
import lombok.NoArgsConstructor;


/**
 * 
 * <pre>
 * ShopInfoVO : 매장 정보 VO
 * </pre>
 * @author <a href="simhyung777@naver.com">심현종</a></br>
 * @date ${date}
 * @version 1.0
 * @since 2020-12-07
 * @param 
 * userLocalX[String] : 접속 사용자 위도
 * userLocalY[String] : 접속 사용자 경도
 * sCode[String] : 매장 코드
 * sName[String] : 매장 이름
 * sAddr[String] : 매장 주소
 * sPhone[String] : 매장 전화번호
 * sGpsX[String] : 매장 위도
 * sGpsY[String] : 매장 경도
 * sTime[String] : 매장 운영시간
 * sTitle[String] : 매장 소개 제목
 * sContent[String] : 매장 소개 내용
 * sParking[boolean] : 주차가능 여부
 * sWifi[boolean] : wifi 가능 여부
 * sSubway[boolean] : 지하철 역근처
 * sCharge[boolean] : 추가요금 없음
 * sPickup[boolean] : 픽업여부
 * sBigdog[boolean] : 대형견 가능여부
 * sAvgScore[boolean] : 매장 평점
 * sLocale[boolean] : 거리 연산 결과
 * sPhotopath[String] : 매장 사진 경로
 * sPhotoname[String] : 매장 사진 이름
 * sPhotonameOrigin[String] : 매장 사진 원래 이름
 * pCat[boolean] : 고양이 매장
 * pDog[boolean] : 강아지 매장
 * pShort[boolean] : 고양이 단모
 * pLong[boolean] : 고양이 장모
 * pSmall[boolean] : 소형견
 * pMedium[boolean] : 중현견
 * pLarge[boolean] : 대형견
 */
@Data
@NoArgsConstructor
public class CndSalonShopInfoVO {
	private String userLocalX;
	private String userLocalY;
	private String sCode;
	private String sName;
	private String sAddr;
	private String sPhone;
	private String sGpsX;
	private String sGpsY;
	private String sTime;
	private String sTitle;
	private String sContent;
	private boolean sParking;
	private boolean sWifi;
	private boolean sSubway;
	private boolean sCharge;
	private boolean sPickup;
	private boolean sBigdog;
	private double sAvgScore;
	private double sLocale;
	private String sPhotopath;
	private String sPhotoname;
	private String sPhotonameOrigin;
	private boolean pCat;
	private boolean pDog;
	private boolean pShort;
	private boolean pLong;
	private boolean pSmall;
	private boolean pMedium;
	private boolean pLarge;
}// Class END
