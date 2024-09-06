package strategy2.modeularization;

import strategy2.interfaces.*;

public class CasperCar extends Car{
	public CasperCar() {
		setEngine(new EngineLow());
		setMileage(new Mileage20());
		setFuel(new FuelDiesel());
	}

	public void shape() {
		System.out.println(" = 캐스퍼 = ");
		
	}
}
