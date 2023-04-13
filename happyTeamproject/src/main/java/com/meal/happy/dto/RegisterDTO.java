package com.meal.happy.dto;

import java.util.Arrays;

public class RegisterDTO {
	private String userid;
	private String userpwd;
	private String username;
	private String email;
	private String hobby;
	private String hobbyArr[];
	private String writedate;
	
	

	@Override
	public String toString() {
		return "RegisterDTO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", email=" + email + ", hobby=" + hobby + ", hobbyArr="
				+ Arrays.toString(hobbyArr) + ", writedate=" + writedate + "]";
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
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHobby() {
		//배열의 취미를 문자열을 바꿔 내보내기
		//[바이크, 영화감상, 자전거]
		String hobbyStr = Arrays.toString(hobbyArr);
		hobbyStr = hobbyStr.substring(1, hobbyStr.length()-1);//바이크, 영화감상, 자전거
		hobbyStr = hobbyStr.replace(", ", "/"); //  바이크/영화감상/자전거
		hobby = hobbyStr;
		return hobby;
	}
	public void setHobby(String hobby) {//바이크/영화감상/자전거
		this.hobby = hobby;
		hobbyArr = hobby.split("/");//취미를 문자열에서 배열로 변환
	}
	public String[] getHobbyArr() {
		return hobbyArr;
	}
	public void setHobbyArr(String[] hobbyArr) {
		this.hobbyArr = hobbyArr;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	
	
}
	
