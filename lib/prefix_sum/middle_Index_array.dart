// leetcode 1991

class Solution {
  int findMiddleIndex(List<int> nums) {
    int totalSum = 0;
    for (int i = 0; i < nums.length; i++) {
      totalSum = totalSum += nums[i];
    }
    print(totalSum);
    int leftSum = 0;
    for (int i = 0; i < nums.length; i++) {
      if (i != 0) leftSum += nums[i - 1];
      if (totalSum - leftSum - nums[i] == leftSum) {
        return i;
      }
    }
    return -1;
  }
}