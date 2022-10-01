import 'dart:math';

void main() {
  print(Solution().rob([2, 7, 9, 3, 1]));
}

class Solution {
  int rob(List<int> nums) {
    List<int?> memo = List.generate(
      nums.length + 1,
      (index) => null,
    );
    return _rob( nums, memo);
  }

  int _rob( List<int> nums, List<int?> memo) {
    if (nums.length == 0) return 0;
    memo[0] = 0;
    memo[1] = nums[0];
    for (int i = 1; i < nums.length; i++) {
      memo[i + 1] = max(memo[i]!, memo[i - 1]! + nums[i]);
    }
    return memo[nums.length]!;
  }
}
