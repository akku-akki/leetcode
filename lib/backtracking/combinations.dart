void main() {
  print(Solution().combine(4, 2));
}

class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> ans = [];
    if (k == 0) {
      ans.add([]);
      return ans;
    }
    backtrack(1, [], n, k, ans);
    return ans;
  }

  void backtrack(
      int start, List<int> current, int n, int k, List<List<int>> ans) {
    if (current.length == k) {
      ans.add([...current]);
    }
    for (int i = start; i <= n && current.length < k; i++) {
      current.add(i);
      backtrack(i + 1, current, n, k, ans);
      current.removeLast();
    }
  }
}
