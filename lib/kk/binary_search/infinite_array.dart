void main() {
  print(ans([3, 5, 7, 9, 10, 90, 100, 130, 140, 160, 170], 10));
}

int ans(List<int> nums, int target) {
  // first find the range
  // first start with a box of size 2
  int start = 0;
  int end = 1;

  //codition for the target to lie in the range
  while (target > nums[end]) {
    int temp = end + 1;
    end = end + (end - start + 1) * 2;
    start = temp;
  }

  return binarySearch(nums, target, start, end);
}

int binarySearch(List<int> nums, int target, int start, int end) {
  while (start <= end) {
    int mid = (start + end) ~/ 2;

    if (target < nums[mid]) {
      end = mid - 1;
    } else if (target > nums[mid]) {
      start = mid + 1;
    } else {
      return mid;
    }
  }

  return -1;
}
