void main() {
  final matrix = [
    [10, 20, 30, 40],
    [15, 25, 35, 45],
    [28, 29, 37, 49],
    [33, 34, 38, 50],
  ];
  print(search(matrix, 49));
}

List<int> search(List<List<int>> matrix, int target) {
  int r = 0;
  int c = matrix.length - 1;

  while (r < matrix.length && c >= 0) {
    if (matrix[r][c] == target) {
      return [r, c];
    }
    if (matrix[r][c] < target) {
      r++;
    } else {
      c--;
    }
  }

  return [-1, -1];
}
