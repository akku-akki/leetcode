void main() {
  Solution().rotate([
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]);
}

class Solution {
  void rotate(List<List<int>> matrix) {
    int n = matrix.length;
    int layers = n ~/ 2;

    for (int layer = 0; layer < layers; layer++) {
      int start = layer;
      int end = n - 1 - layer;
      for (int i = start; i < end; i++) {
        //top in temp

        int temp = matrix[start][i];
        //left in top

        matrix[start][i] = matrix[n - 1 - i][start];
        //bottom in left

        matrix[n - 1 - i][start] = matrix[end][n - 1 - i];
        //right in bottom

        matrix[end][n - 1 - i] = matrix[i][end];
        //top in right

        matrix[i][end] = temp;
      }
    }
  }
}
