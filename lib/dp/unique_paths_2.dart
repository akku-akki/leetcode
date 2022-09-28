void main() {
  print(Solution().uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]));
}

class Solution {
  int uniquePathsWithObstacles(List<List<int>> obstacleGrid) {
    int row = obstacleGrid.length;
    int column = obstacleGrid.first.length;
    final List<List<int?>> record = List.generate(
        row, ((index) => List.generate(column, ((index) => null))));
    return _uniquePathsWithObstacles(0, 0, obstacleGrid, record);
  }

  int _uniquePathsWithObstacles(int row, int column,
      List<List<int>> obstacleGrid, List<List<int?>> record) {
    final int rowIndex = row;
    final int columnIndex = column;
    if (row >= obstacleGrid.length || column >= obstacleGrid.first.length)
      return 0;
    if (obstacleGrid[rowIndex][columnIndex] == 1) {
      return 0;
    }
    if (row == obstacleGrid.length - 1 &&
        column == obstacleGrid.first.length - 1) {
      return 1;
    }
    if (record[rowIndex][columnIndex] != null) {
      return record[rowIndex][columnIndex]!;
    }
    int downPaths =
        _uniquePathsWithObstacles(row + 1, column, obstacleGrid, record);
    int rightPaths =
        _uniquePathsWithObstacles(row, column + 1, obstacleGrid, record);
    record[rowIndex][columnIndex] = downPaths + rightPaths;
    return record[rowIndex][columnIndex]!;
  }
}
