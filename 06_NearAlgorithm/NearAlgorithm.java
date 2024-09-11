//[?] 원본 데이터 중에서 대상 데이터와 가장 가까운 값

/**
 * 근사값 알고리즘 (NearAlgorithm): 차잇값의 절댓값의 최솟값
 */
public class NearAlgorithm {
    public static int Abs(int number) {
        return (number < 0) ? -number : number;
    }
    public static void main(String[] args) {
        //[1] Initialize
        int min = Integer.MAX_VALUE; // 차이값의 절대값의 최소값이 담길 그릇

        //[2] Input
        int[] numbers = { 10, 20, 30, 40, 27, 17 };
        int target = 205; // target 하고 가장 가까운 값
        int near = 0; // 가까운 값

        //[3] Process
        for (int i = 0; i < numbers.length; i++) {
            int abs = Abs(numbers[i] - target);
            if (abs < min) {
                min = abs; // MIN : 최소값 알고리즘
                near = numbers[i]; // near : 차이값의 절대값의 최소값일 때의 값
            }
        }

        //[4] Output
        System.out.println(target + "와 가장 가까운값: " + near + "(차이: " + min + ")");
    }
}