package strategy2.modeularization;

import strategy2.interfaces.*;

public abstract class Car {
	private EngineImpl engine;
	private MileageImpl mileage;
	private FuelImpl fuel;
//	String className = getClass().getName();
//	int idx = className.lastIndexOf(".");
//	String name = className.substring(idx+1);
	public abstract void shape() ;
//		String className = getClass().getName();
//		int idx = className.lastIndexOf(".");
//		String Name = className.substring(idx+1);
//		System.out.println( name " Door, Sheet, Handle 이 있습니다")
//	}
	public void actionDrive() {
		System.out.println(" 드라이브 중 입니다 ");
	}
	public void actionForm() {
		System.out.println(" Door, Sheet, Handle 이 있습니다");
	}
	public void actionEngine() {
		engine.engine();
	}
	public void actionMileage() {
		mileage.mileage();
	}
	public void actionFuel() {
		fuel.fuel();
	}

	public void setEngine(EngineImpl engine) {
		this.engine = engine;
	}

	public void setMileage(MileageImpl mileage) {
		this.mileage = mileage;
	}

	public void setFuel(FuelImpl fuel) {
		this.fuel = fuel;
	}

}
