//[?] 주어진 데이터 중 가장 큰 값

/**
 * 최댓값 알고리즘(MaxAlgorithm): 주어진 범위 + 주어진 조건
 */
public class MaxAlgorithm {
    public static void main(String[] args) {
        //[0] Initilize
        int max = Integer.MIN_VALUE; // 정수 형식의 데이터 중 가장 작은 값으로 초기화

        //[1] 입력(Input)
        int[] numbers = { -2, -5, -3, -8, -1 };

        //[2] 처리: Max
        for (int i = 0; i < numbers.length; i++) {
            if (numbers[i] > max) {
                max = numbers[i]; // Max: 더 큰 값으로 할당
            }
        }

        //[3] 출력
        System.out.println("최대값: " + max);
    }
}