void main() {
  print(Solution().findTargetSumWays([
    33,
    36,
    38,
    40,
    25,
    49,
    1,
    8,
    50,
    13,
    41,
    50,
    29,
    27,
    18,
    25,
    37,
    8,
    0,
    48
  ], 0));
}

class Solution {
  int findTargetSumWays(List<int> nums, int target) {
    Map<String, int> lookUp = {};
    return getWays(nums, -target, 0, lookUp);
  }

  int getWays(List<int> nums, int target, int index, Map<String, int> lookUp) {
    if (index == nums.length) return target == 0 ? 1 : 0;
    final key = '$index' + '' + '$target';
    if (!lookUp.containsKey(key)) {
      int x = getWays(nums, target + nums[index], index + 1, lookUp);
      int y = getWays(nums, target - nums[index], index + 1, lookUp);
      lookUp[key] = x + y;
    }
    return lookUp[key]!;
  }
}
