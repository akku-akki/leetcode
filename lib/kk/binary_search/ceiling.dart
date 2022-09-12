void main() {
  print(ceiling([2, 3, 5, 9, 14, 16, 18], 90));
}

int ceiling(List<int> nums, int target) {
  int start = 0;
  int end = nums.length - 1;

  //if the target is greater than the greatest number in the array
  if (target > nums[nums.length - 1]) {
      return -1;
  }

// return the index of smallest no >= target
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

  return start;
}
