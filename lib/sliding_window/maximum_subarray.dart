import 'dart:math';

void main() {
  print(Solution().maxSubArray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
}

class Solution {
  int maxSubArray(List<int> nums) {
    int totalSum = nums[0];
    int currentTotal = totalSum;
    for (int i = 1; i < nums.length; i++) {
      currentTotal = max(nums[i] + currentTotal, nums[i]);
      totalSum = max(currentTotal, totalSum);
    }
    return totalSum;
  }
}
