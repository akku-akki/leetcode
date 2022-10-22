import 'dart:collection';

void main() {
  print(Solution().numEnclaves(
    [
      [0, 0, 0, 0],
      [1, 0, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0]
    ],
  ));
}

class Solution {
  int numEnclaves(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int result = 0;
    DoubleLinkedQueue<Points> q = DoubleLinkedQueue();
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        result += grid[i][j];
        if (i * j == 0 || i == m - 1 || j == n - 1) {
          q.addLast(Points(i, j));
        }
      }
    }
    while (q.isNotEmpty) {
      Points points = q.removeFirst();
      int x = points.x;
      int y = points.y;
      if (x < 0 || y < 0 || x == m || y == n || grid[x][y] != 1) continue;
      grid[x][y] = 0;
      --result;
      q.addLast(Points(x + 1, y));
      q.addLast(Points(x - 1, y));
      q.addLast(Points(x, y + 1));
      q.addLast(Points(x, y - 1));
    }
    return result;
  }
}

class Points {
  int x;
  int y;
  Points(this.x, this.y);
}




// DFS => STACK overFlow

// class Solution {
//   int numEnclaves(List<List<int>> grid) {
//     int m = grid.length;
//     int n = grid[0].length;
//     int landCount = 0;

//     for (int i = 0; i < m; i++) {
//       for (int j = 0; j < n; j++) {
//         if (i * j == 0 || i == m - 1 || j == n - 1) {
//           replaceBoundary(i, j, m, n, grid);
//         }
//       }
//     }

//     for (int i = 0; i < m; i++) {
//       for (int j = 0; j < n; j++) {
//         if (grid[i][j] == 1) {
//           landCount++;
//         }
//       }
//     }
//     return landCount;
//   }

//   void replaceBoundary(int i, int j, int m, int n, List<List<int>> grid) {
//     if (!(i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == 1)) return;
//     grid[i][j] = 0;
//     replaceBoundary(i + 1, j, m, n, grid);
//     replaceBoundary(i - 1, j, m, n, grid);
//     replaceBoundary(i, j + 1, m, n, grid);
//     replaceBoundary(i, j - 1, m, n, grid);
//   }
// }

//     // if (isValid(i + 1, j, m, n, grid)) replaceBoundary(i + 1, j, m, n, grid);
//     // if (isValid(i - 1, j, m, n, grid)) replaceBoundary(i - 1, j, m, n, grid);
//     // if (isValid(i, j + 1, m, n, grid)) replaceBoundary(i, j + 1, m, n, grid);
//     // if (isValid(i, j - 1, m, n, grid)) replaceBoundary(i, j - 1, m, n, grid);