package talkdog.vo;

import java.io.Serializable;

public class TestnameVO implements Serializable{

	private static final long serialVersionUID=1L;	//객체 내부직렬화를 위한 것 (안해도 괜찮음)

	private String tName; //테스트 이름

	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	
}
