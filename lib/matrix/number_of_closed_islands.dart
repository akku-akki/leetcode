void main() {
  print(Solution().closedIsland([
    [1, 1, 1, 1, 1, 1, 1],
    [1, 0, 0, 0, 0, 0, 1],
    [1, 0, 1, 1, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 1, 1, 0, 1],
    [1, 0, 0, 0, 0, 0, 1],
    [1, 1, 1, 1, 1, 1, 1]
  ]));
}

class Solution {
  int closedIsland(List<List<int>> grid) {
    int m = grid.length;
    int n = grid[0].length;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (i * j == 0 || i == m - 1 || j == n - 1) {
          if (grid[i][j] == 0) {
            sinkLand(i, j, m, n, grid);
          }
        }
      }
    }

    int ans = 0;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == 0) {
          ans++;
          sinkLand(i, j, m, n, grid);
        }
      }
    }

    return ans;
  }

  void sinkLand(
    int i,
    int j,
    int m,
    int n,
    List<List<int>> grid,
  ) {
    grid[i][j] = 1;
    if (island(i + 1, j, m, n, grid)) sinkLand(i + 1, j, m, n, grid);
    if (island(i - 1, j, m, n, grid)) sinkLand(i - 1, j, m, n, grid);
    if (island(i, j + 1, m, n, grid)) sinkLand(i, j + 1, m, n, grid);
    if (island(i, j - 1, m, n, grid)) sinkLand(i, j - 1, m, n, grid);
  }

  bool island(
    int i,
    int j,
    int m,
    int n,
    List<List<int>> grid,
  ) =>
      i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == 0;
}
