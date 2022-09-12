void main() {
  final nums = [18, 12, -7, 3, 14, 28];

  print(findMin(nums));
}

// Assume nums.length !=0
// return minimum value in array
int findMin(List<int> nums) {
  int min = nums[0];

  for (int i = 1; i < nums.length; i++) {
    if (nums[i] < min) {
      min = nums[i];
    }
  }

  return min;
}
