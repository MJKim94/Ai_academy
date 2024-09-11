//[?] n명의 점수 중에서 80점이상 95점 이하인 점수의 평균

/**
 * 평균 알고리즘(Averrage Algorithm): 주어진 범위에 주어진 조건에 해당하는 자료들의 평균
 */
public class AverageAlgorithm {
    public static void main(String[] args) {
        //[1] Input: n명의 성적
        int[] data = { 90, 59 , 48 , 50, 95 };
        int sum = 0;
        int count = 0;

        //[2] process: Average = SUM / COUNT
        for (int i = 0; i < data.length; i++) {
            if (data[i] >= 80 && data[i] <=95) {
                sum += data[i];
                count++;
            }
        }

        double avg = sum / (double)count;

        //[3] Output
        System.out.println("80점 이상 95점 이하인 자료의 평균: " + avg);
    }
}