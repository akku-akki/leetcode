void main() {
  print(binarySearch([-18, -12, -4, 0, 2, 3, 4, 15, 16, 18, 22, 45, 89], 100));
}

int binarySearch(List<int> nums, int target) {
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

  return -1;
}
