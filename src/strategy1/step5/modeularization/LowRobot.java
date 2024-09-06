package strategy1.step5.modeularization;

import strategy1.step4.interfaces.*;

public class LowRobot extends Robot{
	public LowRobot() {
		/*setI(10); i = 10;
		 * setFly(new FlyNo()); = 이렇게 사용 가능
		 */
		setFly(new FlyNo());
		setMissile(new MissileNo());
		setKnife(new KnifeToy());
	}

	@Override
	public void shape() {
		System.out.println(" = = 저렴이 로봇 = = ");
		
	}
	

}
