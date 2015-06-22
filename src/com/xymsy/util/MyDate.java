package com.xymsy.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import org.springframework.stereotype.Component;

@Entity
@Component
public class MyDate {

	private String time;

	public MyDate() {
		SimpleDateFormat dateformat1 = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		time = dateformat1.format(new Date());
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "MyDate [time=" + time + "]";
	}
}
