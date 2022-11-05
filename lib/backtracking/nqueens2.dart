import 'dart:math';

void main() {
  print(Solution().solveNQueens(4));
}

class Solution {
  int solveNQueens(int n) {
    List<List<String>> board =
        List.generate(n, (index) => List.generate(n, ((index) => '.')));
    ;

    return sloveQueens(board, 0);
  }

  int sloveQueens(List<List<String>> board, int row) {
    if (row == board.length) {
      List<String> newBoard = [];
      String row = '';

      board.forEach((element) {
        row = '';
        element.forEach((element) {
          row = row + element;
        });
        newBoard.add(row);
      });
      print(newBoard);
      return 1;
    }
    int count = 0;
    for (int col = 0; col < board.length; col++) {
      if (isSafe(board, row, col)) {
        board[row][col] = 'Q';
        count = count + sloveQueens(board, row + 1);
        board[row][col] = '.';
      }
    }
    return count;
  }

  bool isSafe(List<List<String>> board, int row, int col) {
    // check Vertical
    for (int i = 0; i < row; i++) {
      if (board[i][col] == 'Q') {
        return false;
      }
    }
    // check diagonal left
    int maxLeft = min(row, col);
    for (int i = 1; i <= maxLeft; i++) {
      if (board[row - i][col - i] == 'Q') {
        return false;
      }
    }

    // check diagonal right
    int maxRight = min(row, board.length - col - 1);
    for (int i = 1; i <= maxRight; i++) {
      if (board[row - i][col + i] == 'Q') {
        return false;
      }
    }
    return true;
  }
}
