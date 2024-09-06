package strategy1.step5.modeularization;

import strategy1.step4.interfaces.*;

public class SuperRobot extends Robot{
	public SuperRobot() {
//		fly = new FlyYes();
//		missile = new MissileYes();
//		knife = new KnifeLazer();
		setFly(new FlyYes());
		setMissile(new MissileYes());
		setKnife(new KnifeLazer());
	}

	@Override
	public void shape() {
		System.out.println(" = = 비싼 로봇 = = ");
		// TODO Auto-generated method stub
		
	}

}
