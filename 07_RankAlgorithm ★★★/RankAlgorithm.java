/**
 * RankAlgorithm
 */
public class RankAlgorithm {

    public static void main(String[] args) {
        int[] scores = { 90, 87, 100, 96, 81 };
        int[] rankings = { 1, 1, 1, 1, 1 };

        for (int i = 0; i < scores.length; i++) {
            rankings[i] = 1;
            for (int j = 0; j < scores.length; j++) {
                if (scores[i] < scores[j]) {
                    rankings[i]++;
                }
            }
        }
        for (int i = 0; i < scores.length; i++) {
            System.out.println(scores[i] + "점: " + rankings[i] + "등");
        }
    }
}