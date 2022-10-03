import '../test/debug_utils.dart/u.dart';

void main() {
  print(Solution().canPartitionKSubsets(
      [6, 5, 9, 6, 3, 5, 1, 10, 4, 1, 4, 3, 9, 9, 3, 3], 9));
}

class Solution {
  bool canPartitionKSubsets(List<int> nums, int k) {
    int total = 0;
    for (int i = 0; i < nums.length; i++) {
      total = total + nums[i];
    }
    if (!(total % k == 0)) return false;
    List<bool> visited = List.generate(
      nums.length,
      (index) => false,
    );
    nums.sort();
    return _canPartitionSubSet(0, k, total ~/ k, 0, visited, nums);
  }

  bool _canPartitionSubSet(
    int start,
    int k,
    int subsetSum,
    int currentSum,
    List<bool> visited,
    List<int> nums,
  ) {
    if (k == 0) return true;
    if (currentSum > subsetSum) return false;
    if (currentSum == subsetSum)
      return _canPartitionSubSet(0, k - 1, subsetSum, 0, visited, nums);
    for (int i = start; i < nums.length; i++) {
      if (i > 0 && !visited[i - 1] && nums[i] == nums[i - 1]) continue;
      if (visited[i]) continue;
      if (!visited[i] && currentSum + nums[i] <= subsetSum) {
        visited[i] = true;
        if (_canPartitionSubSet(
            i + 1, k, subsetSum, currentSum + nums[i], visited, nums))
          return true;
        visited[i] = false;
      }
    }
    return false;
  }
}
