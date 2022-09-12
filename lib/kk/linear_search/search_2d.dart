void main() {
  List<List<int>> data = [
    [23, 4, 1],
    [18, 12, 3, 9],
    [78, 99, 34, 56],
    [18, 12]
  ];
  print(search(data, 0));
}

// Return [row,column]
List<int> search(List<List<int>> data, int target) {
  for (int i = 0; i < data.length; i++) {
    for (int j = 0; j < data[i].length; j++) {
      if (data[i][j] == target) {
        return [i, j];
      }
    }
  }
  return [];
}
