package strategy1.step5.modeularization;

import strategy1.step4.interfaces.*;

public class StandardRobot extends Robot{
	public StandardRobot() {
		setFly(new FlyNo());
		setMissile(new MissileYes());
		setKnife(new KnifeWood());
//		fly = new FlyNo();
//		missile = new MissileYes();
//		knife = new KnifeWood();
	}

	@Override
	public void shape() {
		System.out.println(" = = 평범한 로봇 = = ");
		// TODO Auto-generated method stub
		
	}

}
