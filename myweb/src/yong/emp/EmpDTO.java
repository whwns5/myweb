package yong.emp;

public class EmpDTO {
	private int idx;
	private String name;
	private String email;
	private String dept;

	public EmpDTO() {
		// TODO Auto-generated constructor stub
		System.out.println("empDTO객체 생성됨!");
	}

	public EmpDTO(String name) {
		this.name = name;
	}

	public EmpDTO(int idx, String name, String email, String dept) {
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.dept = dept;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}
	
	
}
