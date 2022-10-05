import 'dart:math';

void main() {
  print(jumpSearch([3, 5, 6, 9, 11, 18, 20, 21, 24, 30], 99));
}

int jumpSearch(List<int> nums, int target) {
  int blockSize = sqrt(nums.length).toInt();
  int start = 0;
  int next = blockSize;

  while (start < nums.length && nums[next - 1] < target) {
    start = next;
    next += blockSize;
    if (next > nums.length) {
      next = nums.length;
    }
  }

  for (int i = start; i < next; i++) {
    if (nums[i] == target) return i;
  }
  return -1;
}
