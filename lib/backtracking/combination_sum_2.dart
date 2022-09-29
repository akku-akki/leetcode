void main() {
  print(Solution().combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
}

class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    List<List<int>> ans = [];
    candidates.sort();
    _getCombination(0, target, [], ans, candidates);
    print(candidates);
    return ans;
  }

  void _getCombination(
    int start,
    int target,
    List<int> currentAns,
    List<List<int>> ans,
    List<int> candidates,
  ) {
    if (target == 0) {
      ans.add([...currentAns]);
      return;
    }
    if (target < 0) return;

    for (int i = start; i < candidates.length; i++) {
      if (i > start && candidates[i] == candidates[i - 1]) {
        continue;
      }
      currentAns.add(candidates[i]);
      _getCombination(
        i + 1,
        target - candidates[i],
        currentAns,
        ans,
        candidates,
      );
      currentAns.removeLast();
    }
  }
}
