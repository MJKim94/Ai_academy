package strategy2.modeularization;

import strategy2.interfaces.*;

public class SonataCar extends Car {
	public SonataCar() {
		setEngine(new EngineMid());
		setMileage(new Mileage15());
		setFuel(new FuelGasoline());
	}

	public void shape() {
		System.out.println(" = 소나타 = ");
		
	}
}
