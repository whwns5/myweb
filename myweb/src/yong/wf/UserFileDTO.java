package yong.wf;

import java.util.Date;

public class UserFileDTO {
	
	private String fileName;
	private String crPath;
	private String updateTime;
	
	public UserFileDTO(){

	}

	public UserFileDTO(String fileName, String crPath, String updateTime) {
		super();
		this.fileName = fileName;
		this.crPath = crPath;
		this.updateTime = updateTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getCrPath() {
		return crPath;
	}

	public void setCrPath(String crPath) {
		this.crPath = crPath;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	
}
