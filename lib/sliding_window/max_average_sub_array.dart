void main() {
  print(Solution().findMaxAverage([1, 12, -5, -6, 50, 3], 4));
}

class Solution {
  double findMaxAverage(List<int> nums, int k) {
    int start = 0;
    int end = 0;
    double total = 0;
    double maxAvg = 0;

    while (end < k) {
      total = total + nums[end];
      end++;
    }
    maxAvg = total / k;
    while (end < nums.length) {
      total = total - nums[start];
      total = total + nums[end];
      final currentMaxAverage = total / k;
      maxAvg = maxAvg < currentMaxAverage ? currentMaxAverage : maxAvg;
      end++;
      start++;
    }
    return maxAvg;
  }
}
