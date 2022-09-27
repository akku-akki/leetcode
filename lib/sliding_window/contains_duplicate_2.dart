void main() {
  print(Solution().containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2));
}

class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    Map<int, int> record = {};
    for (int i = 0; i < nums.length; i++) {
      int current = nums[i];
      if (record.containsKey(current) && i - record[current]! <= k) {
        return true;
      } else {
        record[current] = i;
      }
    }
    return false;
  }
}
