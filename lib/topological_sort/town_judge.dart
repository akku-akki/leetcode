void main() {
  print(Solution().findJudge(3, [
    [1, 3],
    [2, 3],
    [3, 1]
  ]));
}

class Solution {
  int findJudge(int n, List<List<int>> trust) {
    List<int> record = List.generate(n + 1, (index) => 0);
    for (final list in trust) {
      record[list[0]]--;
      record[list[1]]++;
    }
    for (int i = 1; i <= n; i++) {
      if (record[i] == n - 1) return i;
    }
    return -1;
  }
}
