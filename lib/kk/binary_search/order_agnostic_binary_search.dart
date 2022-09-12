void main() {
  final asc = [-18, -12, -4, 0, 2, 3, 4, 15, 16, 18, 22, 45, 89];
  final des = [99, 80, 75, 22, 11, 10, 5, 2, -3];
  print(binarySearch(asc, 22));
}

int binarySearch(List<int> nums, int target) {
  int start = 0;
  int end = nums.length - 1;

  late bool isAsc;
  if (nums[start] < nums[end]) {
    isAsc = true;
  } else {
    isAsc = false;
  }

  while (start <= end) {
    int mid = (start + end) ~/ 2;

    if (target == nums[mid]) {
      return mid;
    }
    if (isAsc) {
      if (target > nums[mid]) {
        start = mid + 1;
      }
      if (target < nums[mid]) {
        end = mid - 1;
      }
    } else {
      if (target < nums[mid]) {
        start = mid + 1;
      }
      if (target > nums[mid]) {
        end = mid - 1;
      }
    }
  }

  return -1;
}
