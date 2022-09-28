// DP := COMBINATION
void main() {
  print(Solution().uniquePaths(3, 7));
}

class Solution {
  int uniquePaths(int m, int n) {
    final List<List<int?>> record =
        List.generate(m, ((index) => List.generate(n, ((index) => null))));
    return _getUniquePaths(m, n, record);
  }

  int _getUniquePaths(int row, int column, List<List<int?>> record) {
    final int rowIndex = row - 1;
    final int columnIndex = column - 1;
    if (row == 1 || column == 1) {
      return 1;
    }
    if (record[rowIndex][columnIndex] != null) {
      return record[rowIndex][columnIndex]!;
    }
    int downPaths = _getUniquePaths(row - 1, column, record);
    int rightPaths = _getUniquePaths(row, column - 1, record);
    record[rowIndex][columnIndex] = downPaths + rightPaths;
    return record[rowIndex][columnIndex]!;
  }
}
