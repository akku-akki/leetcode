void main() {
  print(Solution().combinationSum([2, 3, 6, 7], 7));
}

class Solution {
  List<List<int>> combinationSum(List<int> candidates, int target) {
    final List<List<int>> ans = [];
    _getPossibleSum(candidates, 0, target, ans, []);
    return ans;
  }

  void _getPossibleSum(
    List<int> candidates,
    int start,
    int target,
    List<List<int>> ans,
    List<int> currentAns,
  ) {
    if (target == 0) {
      ans.add([...currentAns]);
      print(currentAns);
      return;
    }
    if (target < 0) return;
    for (int i = start; i < candidates.length; i++) {
      print(candidates[i]);
      currentAns.add(candidates[i]);
      _getPossibleSum(candidates, i, target - candidates[i], ans, currentAns);
      currentAns.removeLast();
    }
  }
}
