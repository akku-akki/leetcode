void main() {
  print(Solution().permuteInternal([1, 1, 2]));
}

class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort();
    return permuteInternal(nums);
  }

  List<List<int>> permuteInternal(List<int> nums) {
    if (nums.length == 0) return [[]];
    final first = nums[0];
    final rest = nums.sublist(1, nums.length);
    final permutationsWithoutFirst = permuteInternal(rest);
    final List<List<int>> allPermutations = [];
    if (permutationsWithoutFirst.isEmpty) return allPermutations;
    permutationsWithoutFirst.forEach(
      (element) {
        int previousElement = -999999999;
        for (int i = 0; i <= element.length; i++) {
          if (i > 0 && previousElement == element[i]) {
            continue;
          }
          if (i > 0) {
            previousElement = element[i];
          }
          final permuteWithFirst = [
            ...element.sublist(0, i),
            first,
            ...element.sublist(i)
          ];
          allPermutations.add(permuteWithFirst);
        }
      },
    );
    return allPermutations;
  }
}
