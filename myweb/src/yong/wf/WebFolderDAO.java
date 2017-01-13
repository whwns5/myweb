package yong.wf;

import java.io.*;
import java.util.ArrayList;


public class WebFolderDAO {
	public static final String USERS_HOME = "E:/조준현/jspstudy/.metadata/.plugins/"
			+ "org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/section/wf/upload";

	private String user; // 사용자의 계정
	private String crPath; // 현재 위치 
	private int totalSize; //총용량	
	private int usedSize; // 사용용량
	private int freeSize; // 남은용량
 	
	public WebFolderDAO(){
		totalSize = 1024 * 1024 * 10; // 10MB
	
	}
	
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getCrPath() {
		return crPath;
	}

	/*
	public void setCrPath(ArrayList<String> arryPath) {
		this.crPath = USERS_HOME;
		for(int i = 0 ; i < arryPath.size() ; i++){
			this.crPath += "/" + arryPath.get(i);
		}
	}
	*/
	public void setCrPath(String crPath) {
		this.crPath = crPath;
	}
	
	public int getTotalSize() {
		return totalSize;
	}

	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}

	public int getUsedSize() {
		return usedSize;
	}

	public void setUsedSize(int usedSize) {
		this.usedSize = usedSize;
	}

	public int getFreeSize() {
		return freeSize;
	}

	public void setFreeSize(int freeSize) {
		this.freeSize = freeSize;
		
	}
	
	/** 사용자의 공간이 있는지 확인 */
	public void userFolderExists(){
		File f = new File(USERS_HOME + "/" + user); // 해당 이름의 파일을 갖는 객체를 생성
		if(!(f.exists())){ // 해당 이름의 폴더가 없을 경우
			f.mkdirs();
		}
		
		usedSize = 0;
		
		settingUsedSize(f);
		
		freeSize = totalSize - usedSize;
	}
	
	/** 사용자 용량을 세팅 */
	public void settingUsedSize(File f){
		File files[] = f.listFiles();
		if(files != null){
			for(int i = 0 ; i < files.length ; i++){
				if( files[i].isFile() ) { // 해당 파일이 파일 일 경우
					usedSize += files[i].length(); // 해당 용량을 누적
				} else { // 해당 파일이 디렉토리 일 경우 
					settingUsedSize(files[i]);
				}
			}
		}
	}
	
	/** 파일 전체 조회 */
	public ArrayList<UserFileDTO> getListAll(){
		ArrayList<UserFileDTO> arryUserFileDTO = new ArrayList<UserFileDTO>();
		File f = new File(this.USERS_HOME + "/" + crPath);
		File files[] = null;
		if(f.isDirectory()){ // 해당 file이 디렉토리 일 경우
			files = f.listFiles();
			
			for(int i = 0 ; i < files.length ; i++){
				//arryUserFileDTO.add( new UserFileDTO(files[i].getName(), files[i].isDirectory(), this.crPath) );
			}
		}
		return arryUserFileDTO;
	}
	
	/** 해당 폴더 유무 검사 메서드 */
	public boolean isExistFolder(String folderName){
		File f = new File(this.USERS_HOME + "/" + this.crPath + "/" + folderName);
		if(f.exists() && f.isDirectory()){
			return true;
		} else {
			return false;
		}
	}
	
	/** 폴더 생성 관련 메서드*/
	public boolean createFolder(){
		String newFolderName = "새폴더";
		int tempCount = 0;
		
		while(isExistFolder(newFolderName)){ // 해당 폴더이름이 존재하지 않을때 까지
			// 존재시 ..
			tempCount++;
			newFolderName = "새폴더 (" + tempCount + ")";
		}
	
		File f = new File(this.USERS_HOME + "/" + this.crPath + "/" + newFolderName);
		if(f.mkdir()){
			return true;
		} else {
			return false;
		}
	}
	
	/** 폴더 생성 관련 메서드*/
	public boolean createFolder(String newFolderName){
		File f = new File(this.USERS_HOME + "/" + this.crPath + "/" + newFolderName);
		if(f.mkdir()){
			return true;
		} else {
			return false;
		}
	}
	/*
	public File[] getListFiles(File f){
		File files[] = null;
		if(f.isDirectory()){
			files = f.listFiles();
		}	
		return files;
	}
	*/
	/*
	public void nextPage(String nextFileName){
		this.befPath = this.crPath;
		this.crPath += "/" + nextFileName;
	}
	
	public void beforePage(){
		this.crPath = befPath;
	}
	*/
}
