/**
 * MinAlgorithm
 */
public class MinAlgorithm {
    public static void main(String[] args) {
        //[1] Initialize
        int min = Integer.MAX_VALUE;

        //[2] Input
        int[] numbers = { 2, 4, 5, 1, 6, 8 };

        //[3] Process: MIN
        for (int i = 0; i < numbers.length; i++) {
            if (numbers[i] < min && numbers[i] % 2 == 0) { 
                min = numbers[i];
            }
        }

        //[4] Output
        System.out.println("짝수 최솟값: " + min);
    }
}