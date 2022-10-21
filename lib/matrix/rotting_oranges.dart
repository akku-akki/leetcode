import 'dart:collection';

void main() {
  print(Solution().orangesRotting([
    [2, 1, 1],
    [1, 1, 0],
    [0, 1, 1]
  ]));
}

class Solution {
  int orangesRotting(List<List<int>> grid) {
    int fresh = 0;
    int time = 0;
    int m = grid.length;
    int n = grid[0].length;
    DoubleLinkedQueue<OrangePosition> q = DoubleLinkedQueue();
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          fresh++;
        } else if (grid[i][j] == 2) {
          q.add(OrangePosition(i, j));
        }
      }
    }
    if (fresh == 0) return 0;
    while (q.isNotEmpty) {
      int qSize = q.length;
      int temp = 0;
      while (qSize > 0) {
        final current = q.removeFirst();
        List<int> arrX = [1, -1, 0, 0];
        List<int> arrY = [0, 0, 1, -1];
        for (int i = 0; i < 4; i++) {
          int x = arrX[i] + current.x;
          int y = arrY[i] + current.y;
          if (isValidPosition(x, y, m, n, grid)) {
            temp++;
            grid[x][y] = 2;
            q.addLast(OrangePosition(x, y));
          }
        }
        qSize--;
      }
      if (temp != 0) time++;
    }
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          time = 0;
          break;
        }
      }
    }
    return time == 0 ? -1 : time;
  }
  bool isValidPosition(int i, int j, int m, int n, List<List<int>> grid) =>
      i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == 1 ? true : false;
}

class OrangePosition {
  int x;
  int y;
  OrangePosition(this.x, this.y);
}
