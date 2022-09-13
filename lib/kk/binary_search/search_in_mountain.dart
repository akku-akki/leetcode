import 'mountain.dart';

void main() {
  // print(search([1,2,3,4,5,3,1],));
}

int search(List<int> nums, int target) {
  int peak = peakIndexInMountainArray(nums);
  int firstTry = binarySearch(nums, target, 0, peak);
  if (firstTry != -1) {
    return firstTry;
  }
  return binarySearch(nums, target, peak + 1, nums.length - 1);
}

int findPeak(List<int> arr) {
  int start = 0;
  int end = arr.length - 1;

  while (start < end) {
    int mid = (start + end) ~/ 2;

    if (arr[mid] > arr[mid + 1]) {
      end = mid;
    } else {
      start = mid + 1;
    }
  }
  return start;
}

int binarySearch(List<int> nums, int target, int start, int end) {
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
