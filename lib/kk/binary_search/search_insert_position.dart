void main() {
  print(Solution().searchInsert([1, 3, 5, 6], 5));
}

class Solution {
  int searchInsert(List<int> nums, int target) {
    return binarySearch(nums, target);
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

    return end + 1;
  }
}
