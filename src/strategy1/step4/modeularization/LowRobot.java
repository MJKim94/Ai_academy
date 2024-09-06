package strategy1.step4.modeularization;

import strategy1.step4.interfaces.*;

public class LowRobot extends Robot{
	private FlyImpl fly;
	private MissileImpl missile;
	private KnifeImpl knife;
	public LowRobot() {
		/*setI(10); i = 10;
		 * setFly(new FlyNo()); = 이렇게 사용 가능
		 */
		fly = new FlyNo();
		missile = new MissileNo();
		knife = new KnifeToy();
	}
	@Override
	public void actionFly() {
		fly.fly();
	}
	@Override
	public void actionMissile() {
		missile.missile();
	}
	@Override
	public void actionKnife() {
		knife.knife();
	}
	public void setFly(FlyImpl fly) {
		this.fly = fly;
	}
	public void setMissile(MissileImpl missile) {
		this.missile = missile;
	}
	public void setKnife(KnifeImpl knife) {
		this.knife = knife;
	}

}
