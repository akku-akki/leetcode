import 'dart:math';

void main() {
  List<List<int>> grid = [
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]
  ];
  print(Solution().maxAreaOfIsland(grid));
}

class Solution {
  int area = 0;
  int maxAreaOfIsland(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int ans = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 1) {
          coutIslandArea(i, j, m, n, grid);
          ans = max(ans, area);
        }
        area = 0;
      }
    }
    return ans;
  }

  void coutIslandArea(int i, int j, int m, int n, List<List<int>> grid) {
    area++;
    grid[i][j] = 0;
    if (isValid(i + 1, j, m, n, grid)) coutIslandArea(i + 1, j, m, n, grid);
    if (isValid(i - 1, j, m, n, grid)) coutIslandArea(i - 1, j, m, n, grid);
    if (isValid(i, j + 1, m, n, grid)) coutIslandArea(i, j + 1, m, n, grid);
    if (isValid(i, j - 1, m, n, grid)) coutIslandArea(i, j - 1, m, n, grid);
  }

  bool isValid(int i, int j, int m, int n, List<List<int>> grid) =>
      i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == 1;
}
