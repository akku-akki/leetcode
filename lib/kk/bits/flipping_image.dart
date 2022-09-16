void main() {
  Solution s = Solution();
  s.flipAndInvertImage([
    [1, 1, 0],
    [1, 0, 1],
    [0, 0, 0]
  ]);
}

class Solution {
  List<List<int>> flipAndInvertImage(List<List<int>> image) {
    for (List<int> row in image) {
      for (int i = 0; i < (image[0].length + 1) ~/ 2; i++) {
        int temp = row[i] ^ 1;
        row[i] = row[image[0].length - i - 1] ^ 1;
        row[image[0].length - i - 1] = temp;
      }
    }
    return image;
  }
}
