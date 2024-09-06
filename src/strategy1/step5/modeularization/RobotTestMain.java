package strategy1.step5.modeularization;

import strategy1.step4.interfaces.FlyHigh;
import strategy1.step4.interfaces.KnifeToy;

public class RobotTestMain {
	public static void main(String[] args) {
		SuperRobot superRobot = new SuperRobot();
		StandardRobot standardRobot = new StandardRobot();
		LowRobot lowRobot = new LowRobot();
		Robot[] robots = {superRobot, standardRobot, lowRobot};
		for(Robot robot : robots) {
			robot.shape();
			robot.actionWalk();
			robot.actionRan();
			robot.actionFly();
			robot.actionMissile();
			robot.actionKnife();

//			if(robot instanceof SuperRobot) {
//				SuperRobot tempRobot = (SuperRobot)robot;
//				tempRobot.actionFly();
//				tempRobot.actionMssile();
//				tempRobot.actionNnife();
//			}else if(robot instanceof StandardRobot) {
//				StandardRobot tempRobot = (StandardRobot)robot;
//				tempRobot.actionFly();
//				tempRobot.actionMssile();
//				tempRobot.actionNnife();
//			}else if(robot instanceof LowRobot) {
//				LowRobot tempRobot = (LowRobot)robot;
//				tempRobot.actionFly();
//				tempRobot.actionMssile();
//				tempRobot.actionNnife();
//			}//if
		}
		System.out.println("비싼 로봇 의 나는 부품을 하늘 높이 나는 기능으로 업그레이드");
		superRobot.setFly(new FlyHigh());
//		superRobot.shape();
		superRobot.actionFly();
		System.out.println("저렴이 로봇 의 검 부품을 장난감 검으로 기능 업그레이드");
		lowRobot.setKnife(new KnifeToy());
//		lowRobot.shape();
		lowRobot.actionKnife();
//		superRobot.shape();
//		superRobot.actionWalk();
//		superRobot.actionRan();
//		superRobot.actionFly();
//		superRobot.actionMssile();
//		superRobot.actionNnife();
//		standardRobot.shape();
//		standardRobot.actionWalk();
//		standardRobot.actionRan();
//		standardRobot.actionFly();
//		standardRobot.actionMssile();
//		standardRobot.actionNnife();
//		lowRobot.shape();
//		lowRobot.actionWalk();
//		lowRobot.actionRan();
//		lowRobot.actionFly();
//		lowRobot.actionMssile();
//		lowRobot.actionNnife();
	}
}
