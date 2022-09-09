// 209. Minimum Size Subarray Sum

import 'dart:math' as Math;

class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    int maxPositive = 99999999999999;
    int startWindow = 0;
    int shortestLength = maxPositive;
    int sum = 0;

    for (int endWindow = 0; endWindow < nums.length; endWindow++) {
      sum = sum + nums[endWindow];
      while (sum >= target) {
        int windowLength = (endWindow - startWindow) + 1;
        shortestLength = Math.min(shortestLength, windowLength);
        sum = sum - nums[startWindow];

        startWindow++;
      }
    }
    return shortestLength == maxPositive ? 0 : shortestLength;
  }
}