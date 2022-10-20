void main() {
  List<List<String>> board = [
    ["X", "X", "X", "X"],
    ["X", "O", "O", "X"],
    ["X", "X", "O", "X"],
    ["X", "O", "X", "X"]
  ];
  Solution().solve(board);
  board.forEach((element) {
    print(element);
  });
}

class Solution {
  void solve(List<List<String>> board) {
    int m = board.length;
    int n = board[0].length;

    for (int i = 0; i < m; i++) {
      int j = 0;
      if (board[i][j] == 'O') {
        dfs(i, j, m, n, board);
      }
      j = n - 1;
      if (board[i][j] == 'O') {
        dfs(i, j, m, n, board);
      }
    }

    for (int j = 0; j < n; j++) {
      int i = 0;
      if (board[i][j] == 'O') {
        dfs(i, j, m, n, board);
      }
      i = m - 1;
      if (board[i][j] == 'O') {
        dfs(i, j, m, n, board);
      }
    }
    convert(board);
  }

  void dfs(int i, int j, int m, int n, List<List<String>> board) {
    board[i][j] = 'B';

    if (isValid(i + 1, j, m, n, board)) dfs(i + 1, j, m, n, board);
    if (isValid(i - 1, j, m, n, board)) dfs(i - 1, j, m, n, board);
    if (isValid(i, j + 1, m, n, board)) dfs(i, j + 1, m, n, board);
    if (isValid(i, j - 1, m, n, board)) dfs(i, j - 1, m, n, board);
  }

  bool isValid(int i, int j, int m, int n, List<List<String>> board) {
    if (i >= 0 && i < m && j >= 0 && j < n && board[i][j] == 'O') {
      return true;
    }
    return false;
  }

  void convert(List<List<String>> board) {
    int m = board.length;
    int n = board[0].length;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (board[i][j] == 'B') {
          board[i][j] = 'O';
        } else if (board[i][j] == 'O') {
          board[i][j] = 'X';
        }
      }
    }
  }
}
