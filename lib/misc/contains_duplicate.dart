void main() {
  print(Solution().containsDuplicate([
    1,
    2,
    3,
    1,
  ]));
}

class Solution {
  bool containsDuplicate(List<int> nums) {
    Set<int> withoutDuplicate = {};
    for (int i = 0; i < nums.length; i++) {
      if (withoutDuplicate.contains(nums[i])) {
        return true;
      } else {
        withoutDuplicate.add(nums[i]);
      }
    }
    return false;
  }
}
