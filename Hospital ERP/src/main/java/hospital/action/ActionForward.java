package hospital.action;

public class ActionForward {
	private boolean isRedirect=false; //뷰의 전환 여부  ...redirect or  forward
	private String path=null; //이동 경로 (뷰의 주소)
	
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	
}
