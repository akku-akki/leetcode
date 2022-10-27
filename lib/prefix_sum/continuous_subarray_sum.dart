void main() {
  print(Solution().checkSubarraySum([23, 2, 4, 6, 7], 6));
}

class Solution {
  bool checkSubarraySum(List<int> nums, int k) {
    Map<int, int> record = {};
    record[0] = -1;
    int prefixSum = 0;
    if (k == 0) {
      for (int i = 0; i < nums.length; i++) {
        if (nums[i] == 0 && nums[i - 1] == 0) {
          return true;
        }
      }
      return false;
    }
    for (int i = 0; i < nums.length; i++) {
      prefixSum = prefixSum + nums[i];
      if (record.containsKey(prefixSum % k)) {
        if (i - record[prefixSum % k]! > 1) {
          return true;
        }
      }
      record.putIfAbsent(prefixSum % k, () => i);
    }
    return false;
  }
}
