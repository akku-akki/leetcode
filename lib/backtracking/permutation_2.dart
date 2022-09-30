void main() {
  print(Solution().permuteUnique([1, 1, 2]));
}

class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort();
    final List<List<int>> allPermutations = [];
    final List<bool> visited = List.generate(nums.length, (index) => false);
    permuteInternal(visited, nums, [], allPermutations);
    return allPermutations.toList();
  }

  void permuteInternal(
    List<bool> visited,
    List<int> nums,
    List<int> current,
    List<List<int>> allPermutations,
  ) {
    if (current.length == nums.length) {
      allPermutations.add([...current]);
      return;
    }
    for (int i = 0; i < nums.length; i++) {
      if (visited[i] == true) {
        continue;
      }
      if (i > 0 && nums[i] == nums[i - 1] && visited[i - 1] == false) {
        continue;
      }
      current.add(nums[i]);
      visited[i] = true;
      permuteInternal(visited, nums, current, allPermutations);
      visited[i] = false;
      current.removeLast();
    }
  }
}
