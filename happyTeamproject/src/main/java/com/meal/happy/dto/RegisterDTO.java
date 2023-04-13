package com.meal.happy.dto;

import java.util.Arrays;

public class RegisterDTO {
	private String userid;
	private String userpwd;
	private String username;
	private String nickname;
	
	private String birthday;
	
	private String email;
	
	private String gender; // 성별
	private String genderArr[];
	
	private String disease; // 질병 종류
	private String diseaseArr[];
	
	private String writedate;
	
	@Override
	public String toString() {
		return "RegisterDTO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", nickname="
				+ nickname + ", birthday=" + birthday + ", email=" + email + ", gender=" + gender + ", genderArr="
				+ Arrays.toString(genderArr) + ", disease=" + disease + ", diseaseArr=" + Arrays.toString(diseaseArr)
				+ ", writedate=" + writedate + "]";
	}
	 
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	////////////////////////////////////////////////////
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	////////////////////////////////////////////////////
	public String getdisease() {
		String diseaseStr = Arrays.toString(diseaseArr);
		diseaseStr = diseaseStr.substring(1, diseaseStr.length()-1); // 바이크, 영화 감상, 자전거
		diseaseStr = diseaseStr.replaceAll(", ", "/"); // 바이크 / 영화 감상 / 자전거
		disease = diseaseStr; // 바이크 / 영화 감상 / 자전거
		return disease;
	}
	public void setdisease(String disease) { // 바이크 / 영화 감상 / 자전거
		this.disease = disease;
		diseaseArr = disease.split("/"); // 취미를 문자열에서 배열로 변환
	}
	
	public String[] getdiseaseArr() {
		return diseaseArr;
	}

	public void setdiseaseArr(String[] diseaseArr) {
		this.diseaseArr = diseaseArr;
	}

	////////////////////////////////////////////////////
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String[] getGenderArr() {
		return genderArr;
	}

	public void setGenderArr(String genderArr[]) {
		this.genderArr = genderArr;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
}
	
