package com.lec.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
@Data
@AllArgsConstructor
public class Member {
	private String id;
	private String pw;
	private String name;
	private Date birth;
	private Timestamp rdate;
}
