import 'dart:math' as Math;

void main() {
  print(Solution().minPathSum([
    [1, 3, 1],
    [1, 5, 1],
    [4, 2, 1]
  ]));
}

class Solution {
  final maxInt = 999999999999;
  int minPathSum(List<List<int>> grid) {
    final rowCount = grid.length;
    final columnCount = grid.first.length;
    final List<List<int?>> record = List.generate(
        rowCount, ((index) => List.generate(columnCount, ((index) => null))));

    return _minPathSum(0, 0, grid, record);
  }

  int _minPathSum(
    int row,
    int column,
    List<List<int>> grid,
    List<List<int?>> record,
  ) {
    if (row >= grid.length || column >= grid.first.length) {
      return maxInt;
    }
    if (row == grid.length - 1 && column == grid.first.length - 1) {
      return grid[row][column];
    }

    if (record[row][column] != null) {
      return record[row][column]!;
    }

    int downPathSum = _minPathSum(row + 1, column, grid, record);
    int rightPathSum = _minPathSum(row, column + 1, grid, record);
    final optimizedCost =
        Math.min(downPathSum, rightPathSum) + grid[row][column];
    record[row][column] = optimizedCost;
    return record[row][column]!;
  }
}
