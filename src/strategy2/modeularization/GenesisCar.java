package strategy2.modeularization;

import strategy2.interfaces.*;

public class GenesisCar extends Car {
	public GenesisCar() {
		setEngine(new EngineHigh());
		setMileage(new Mileage10());
		setFuel(new FuelGasoline());
	}

	public void shape() {
		System.out.println(" = 제네시스 = ");
		
	}
	
}
