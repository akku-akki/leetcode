void main() {
  List<List<String>> grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
];

  print(Solution().numIslands(grid));
}

class Solution {
  int numIslands(List<List<String>> grid) {
    int m = grid.length;
    int n = grid[0].length;
    int ans = 0;

    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == '1') {
          ans++;
          sinkIslands(i, j, m, n, grid);
        }
      }
    }
    return ans;
  }

  void sinkIslands(int i, int j, int m, int n, List<List<String>> grid) {
    grid[i][j] = '0';
    if (isSafe(i - 1, j, m, n, grid)) sinkIslands(i - 1, j, m, n, grid);
    if (isSafe(i + 1, j, m, n, grid)) sinkIslands(i + 1, j, m, n, grid);
    if (isSafe(i, j - 1, m, n, grid)) sinkIslands(i, j - 1, m, n, grid);
    if (isSafe(i, j + 1, m, n, grid)) sinkIslands(i, j + 1, m, n, grid);
  }

  bool isSafe(int i, int j, int m, int n, List<List<String>> grid) {
    if (i >= 0 && i < m && j >= 0 && j < n && grid[i][j] == '1') {
      return true;
    }
    return false;
  }
}
