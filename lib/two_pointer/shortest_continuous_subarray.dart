import 'dart:math';

void main() {
  print(Solution().findUnsortedSubarray([2, 6, 4, 8, 10, 9, 15]));
}

class Solution {
  int findUnsortedSubarray(List<int> nums) {
    int n = nums.length;
    int start = -1;
    int end = -2;
    int minInt = nums[n - 1];
    int maxInt = nums[0];

    for (int i = 1; i < n; i++) {
      int j = n - i - 1;
      maxInt = max(maxInt, nums[i]);
      if (nums[i] < maxInt) {
        end = i;
      }
      minInt = min(minInt, nums[j]);
      if (nums[j] > minInt) {
        start = j;
      }
    }
    return end - start + 1;
  }
}
