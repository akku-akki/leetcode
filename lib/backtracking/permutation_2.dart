import '../test/debug_utils.dart/u.dart';

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
      cPrint(output: 'VISITED STATUS => $visited', c: C.red);
      allPermutations.add([...current]);
      cPrintBg(output: 'ADDING RESULT $current', c: C.purple);
      return;
    }
    for (int i = 0; i < nums.length; i++) {
      if (visited[i] == true) {
        cPrintBg(output: 'Value of I is $i', c: C.green);
        cPrintBg(
            output: 'CONTINUE DUE TO VISITED VISITED  []=> $visited',
            c: C.green);
        continue;
      }
      cPrintBg(
          output: 'I > 0 comparision I==$i is greaterThan ZERO 00',
          c: C.yellow);
      if (i > 0 && nums[i] == nums[i - 1] && visited[i - 1] == false) {
        cPrintBg(
            output: '       START     SKIP DUPLICATE                   ',
            c: C.yellow);
        cPrintBg(output: 'INDEX => $i', c: C.cyan);
        cPrintBg(output: 'NUMS => $nums VISITED => $visited ', c: C.cyan);
        cPrintBg(
            output: '       END     SKIP DUPLICATE                   ',
            c: C.yellow);
        continue;
      }
      current.add(nums[i]);
      visited[i] = true;
      cPrintBg(
          output:
              'ADDING AND MARK VISITED AT INDEX $i per => $current VISITED => $visited',
          c: C.blue);
      permuteInternal(visited, nums, current, allPermutations);
      cPrintBg(
          output:
              'BEFORE REMOVE AND MARK UNVISIT AT INDEX $i per => $current VISITED => $visited',
          c: C.red);
      visited[i] = false;
      current.removeLast();
      cPrintBg(
          output:
              'REMOVE AND MARK UNVISIT AT INDEX $i per => $current VISITED => $visited',
          c: C.red);
    }
  }
}
