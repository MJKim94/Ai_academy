package strategy2.modeularization;

import strategy2.interfaces.FuelHybrid;
import strategy2.interfaces.Mileage20;

public class TestMain {
	public static void main(String[] args) {
		GenesisCar genesisCar = new GenesisCar();
		SonataCar sonataCar = new SonataCar();
		CasperCar casperCar = new CasperCar();
		Car[] cars = {genesisCar, sonataCar, casperCar};
		for(Car car : cars ) {
//			Object engine = EngineImpl;
//			Object mileage;
//			Object fuel;
//			Object drive;
//			System.out.printf("%d, %d, %d = %d ", engine, mileage, fuel, drive);
//			System.out.println(car.actionEngine(),car.actionMileage(),car.F);
			car.shape();
			car.actionForm();
			car.actionDrive();
			car.actionEngine();
			car.actionMileage();
			car.actionFuel();
			
		}
		System.out.println("소나타 의 엔진을 하이브리드 로 교체 하였습니다 ");
		sonataCar.setFuel(new FuelHybrid());
		System.out.println("하이브리드로 변경 되어 연비 상승");
		sonataCar.setMileage(new Mileage20());
		sonataCar.actionMileage();
	}
}
