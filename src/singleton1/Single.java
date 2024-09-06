package singleton1;
/* 데이터 영역 메모리 / heap메모리 영억
 * 클래스(설계도) Static | 일반 변수  
 */
public class Single {
	private int i;
	private Single()	{}
	private static Single INSTANCE = new Single();
	public static Single getInstance() {
		return INSTANCE;
	}
//	private static Single INSTANCE;
//	public static Single getInstance() {
//		// 객체를 생성 안했으면 객체를 생성하고 그 주소를 return
////		객체를 생성했으면, 그객체 주소를 return
//		if(INSTANCE == null) {
//			INSTANCE = new Single();
//		}
//		return INSTANCE;
//	}
	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}
	
}
