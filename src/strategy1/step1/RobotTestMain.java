package strategy1.step1;

public class RobotTestMain {
	public static void main(String[] args) {
		SuperRobot superRobot = new SuperRobot();
		StandardRobot standardRobot = new StandardRobot();
		LowRobot lowRobot = new LowRobot();
		superRobot.shape();
		superRobot.actionWalk();
		superRobot.actionRan();
		superRobot.actionFly();
		superRobot.actionMssile();
		superRobot.actionNnife();
		standardRobot.shape();
		standardRobot.actionWalk();
		standardRobot.actionRan();
		standardRobot.actionFly();
		standardRobot.actionMssile();
		standardRobot.actionNnife();
		lowRobot.shape();
		lowRobot.actionWalk();
		lowRobot.actionRan();
		lowRobot.actionFly();
		lowRobot.actionMssile();
		lowRobot.actionNnife();
	}
}
