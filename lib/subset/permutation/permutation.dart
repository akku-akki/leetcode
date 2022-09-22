void main() {
  // print(Solution().permute([1, 2, 3]));
  Solution().permute([1, 2, 3]);
}

class Solution {
  List<List<int>> permute(List<int> nums) {
    if (nums.length == 0) return [[]];
    print('List Length ${nums.length} => $nums');
    final first = nums[0];
    final rest = nums.sublist(1, nums.length);
    print('FIRST => $first  ==> SECOND $rest');
    final permutationsWithoutFirst = permute(rest);
    final List<List<int>> allPermutations = [];
    print('Empty RECURSION STACK > GOT => $permutationsWithoutFirst \n');
    permutationsWithoutFirst.forEach(
      (element) {
        print('element $element');
        for (int i = 0; i <= element.length; i++) {
          final permuteWithFirst = [
            ...element.sublist(0, i),
            first,
            ...element.sublist(i)
          ];
          print('PERMUTE WITH FIRST => $permuteWithFirst');
          allPermutations.add(permuteWithFirst);
          print('ALL PER => $allPermutations');
        }
      },
    );

    return allPermutations;
  }
}
