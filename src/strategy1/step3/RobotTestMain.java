package strategy1.step3;

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
			robot.actionMssile();
			robot.actionNnife();

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
