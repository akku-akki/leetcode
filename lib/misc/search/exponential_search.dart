import 'dart:math';

import '../../kk/binary_search/binary_search.dart';

void main() {}

int exponentialSearch(List<int> nums, target) {
  int bound = 1;
  while (bound < nums.length && nums[bound] < target) {
    bound = bound * 2;
  }
  int left = bound ~/ 2;
  int right = min(bound, nums.length - 1);
//  return binarySearch(nums, target)
// call RecursiveBinarySearch(nums,target, left, right)
  return -1;
}
