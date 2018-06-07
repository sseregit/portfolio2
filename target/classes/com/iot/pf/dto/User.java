package com.iot.pf.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("User")
public class User {
   private int seq;
   private String fullName;
   private String userName;
   private String email;
   private String password;
   private String createDate;
   private String lastLogin;
   private int reserve;
/**
 * @return the seq
 */
public int getSeq() {
	return seq;
}
/**
 * @param seq the seq to set
 */
public void setSeq(int seq) {
	this.seq = seq;
}
/**
 * @return the fullName
 */
public String getFullName() {
	return fullName;
}
/**
 * @param fullName the fullName to set
 */
public void setFullName(String fullName) {
	this.fullName = fullName;
}
/**
 * @return the userName
 */
public String getUserName() {
	return userName;
}
/**
 * @param userName the userName to set
 */
public void setUserName(String userName) {
	this.userName = userName;
}
/**
 * @return the email
 */
public String getEmail() {
	return email;
}
/**
 * @param email the email to set
 */
public void setEmail(String email) {
	this.email = email;
}
/**
 * @return the password
 */
public String getPassword() {
	return password;
}
/**
 * @param password the password to set
 */
public void setPassword(String password) {
	this.password = password;
}
/**
 * @return the createDate
 */
public String getCreateDate() {
	return createDate;
}
/**
 * @param createDate the createDate to set
 */
public void setCreateDate(String createDate) {
	this.createDate = createDate;
}
/**
 * @return the lastLogin
 */
public String getLastLogin() {
	return lastLogin;
}
/**
 * @param lastLogin the lastLogin to set
 */
public void setLastLogin(String lastLogin) {
	this.lastLogin = lastLogin;
}
/**
 * @return the reserve
 */
public int getReserve() {
	return reserve;
}
/**
 * @param reserve the reserve to set
 */
public void setReserve(int reserve) {
	this.reserve = reserve;
}
/* (non-Javadoc)
 * @see java.lang.Object#toString()
 */
@Override
public String toString() {
	return "User [seq=" + seq + ", fullName=" + fullName + ", userName=" + userName + ", email=" + email + ", password="
			+ password + ", createDate=" + createDate + ", lastLogin=" + lastLogin + ", reserve=" + reserve + "]";
}
}
