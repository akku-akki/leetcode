void main() {
  print(Solution().findMinArrowShots([
    [3, 9],
    [7, 12],
    [3, 8],
    [6, 8],
    [9, 10],
    [2, 9],
    [0, 9],
    [3, 9],
    [0, 6],
    [2, 8]
  ]));
}

class Solution {
  int findMinArrowShots(List<List<int>> points) {
    points.sort(
      (a, b) => a[1].compareTo(b[1]),
    );
    int arrows = 1;
    int end = points[0][1];
    for (int i = 1; i < points.length; i++) {
      if (points[i][0] > end) {
        arrows++;
        end = points[i][1];
      }
    }
    return arrows;
  }
}
