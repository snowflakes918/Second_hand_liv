package com.ldu.pojo;

import java.util.List;

public class NoticeExtend extends User{
    private List<Notice> notice;

	public List<Notice> getNotice() {
		return notice;
	}

	public void setNotice(List<Notice> notice) {
		this.notice = notice;
	}

	@Override
	public String toString() {
		return "NoticeExtend [notice=" + notice + "]";
	}
    
}