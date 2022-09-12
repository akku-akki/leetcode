void main() {
  print(floor([2, 3, 5, 9, 14, 16, 18], 20));
}

// Greatest number <= target
int floor(List<int> nums, int target) {
  int start = 0;
  int end = nums.length - 1;

  while (start <= end) {
    int mid = (start + end) ~/ 2;

    if (target == nums[mid]) {
      return mid;
    }
    if (target > nums[mid]) {
      start = mid + 1;
    }
    if (target < nums[mid]) {
      end = mid - 1;
    }
  }

  return end;
}
