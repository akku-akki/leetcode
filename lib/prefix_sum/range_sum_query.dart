import '../test/debug_utils.dart/u.dart';

void main() {
  NumArray numArray = new NumArray([-2, 0, 3, -5, 2, -1]);
  print(numArray.sumRange(0, 2)); // return (-2) + 0 + 3 = 1
  print(numArray.sumRange(2, 5)); // return 3 + (-5) + 2 + (-1) = -1
  print(numArray.sumRange(0, 5)); // return (-2) + 0 + 3 + (-5) + 2 + (-1) = -3
}

class NumArray {
  late List<int> prefixSum;
  NumArray(List<int> nums) {
    prefixSum = List.generate(nums.length + 1, (index) => 0);
    prefixSum[1] = nums[0];
    for (int i = 1; i <= nums.length; i++) {
      prefixSum[i] = nums[i - 1] + prefixSum[i - 1];
    }
    cPrintBg(c: C.cyan, output: prefixSum);
  }

  int sumRange(int left, int right) {
    return prefixSum[right + 1] - prefixSum[left];
  }
}
