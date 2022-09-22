void main() {
  print(Solution().subsetsWithDup([1, 2, 2]));
  // Solution().subsetsWithDup([4, 4, 4, 1, 4]);
}

class Solution {
  List<List<int>> subsetsWithDup(List<int> nums) {
    nums.sort();
    List<List<int>> _result = [[]];
    int startIndex = 0;
    int endIndex = 0;
    for (int i = 0; i < nums.length; i++) {
      startIndex = i > 0 && nums[i - 1] == nums[i] ? endIndex : 0;
      endIndex = _result.length;
      for (int j = startIndex; j < endIndex; j++) {
        final internalResult = [..._result[j]];
        internalResult.add(nums[i]);
        _result.add(internalResult);
      }
    }
    return _result;
  }
}
