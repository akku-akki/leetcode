void main() {
  print(maximumWealth([
    [2, 8, 7],
    [7, 1, 3],
    [1, 9, 5]
  ]));
}

int maximumWealth(List<List<int>> accounts) {
  int richest = -999999;

  for (int i = 0; i < accounts.length; i++) {
    int sum = 0;
    for (int j = 0; j < accounts[i].length; j++) {
      sum = sum + accounts[i][j];
    }
    if (richest < sum) {
      richest = sum;
    }
  }
  return richest;
}
