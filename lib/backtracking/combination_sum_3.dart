void main() {
  print(Solution().combinationSum3(3, 7));
}

class Solution {
  List<List<int>> combinationSum3(int k, int n) {
    final List<List<int>> ans = [];
    final List<int> current = [];
    _combinationSum3(1, n, k, current, ans);
    return ans;
  }

  void _combinationSum3(
    int startIndex,
    int target,
    int maxLength,
    List<int> current,
    List<List<int>> ans,
  ) {
    if (current.length == maxLength && target == 0) {
      ans.add([...current]);
      return;
    }
    if (target < 0 && current.length == maxLength) {
      return;
    }
    for (int i = startIndex; i <= 9 && current.length < maxLength; i++) {
      late int last;
      if (current.isNotEmpty) {
        last = current.last;
        if (last == i) {
          break;
        }
      }
      ;
      current.add(i);
      _combinationSum3(i + 1, target - i, maxLength, current, ans);
      current.removeLast();
    }
  }
}
