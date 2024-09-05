package com.lec.ex2_store;
/**김치찌개-8,000  부대찌개-8,000  비빔밥-9,000 순대국-안팔아 공기밥-1,000원
 * new HeadQuarterStore("본사") new Store1("1호점")
 * 
 */
public interface HeadQuarterStore {
	//추상메소드 : 메소드 선언만 있고, 구현은 없는 메소드(구현은 상속받은 측에서 진행)
	public abstract void kimchi();
	public abstract void bude(); 
	public abstract void bibim(); 
	public abstract void sunde();
	public abstract void gongi();
}
