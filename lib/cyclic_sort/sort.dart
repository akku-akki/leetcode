void main() {
  List<int> nums = [0, 3, 5, 2, 1, 4];
  print(sort(nums));
}

/// For Range in 1 till N;
List<int> sort(List<int> nums) {
  int i = 0;
  while (i < nums.length) {
    int correctIndex = nums[i] - 1;
    if (nums[i] != nums[correctIndex]) {
      ///Swap
      int temp = nums[i];
      nums[i] = nums[correctIndex];
      nums[correctIndex] = temp;
    } else {
      // Because we still need to check if
      // updated value is at correct position
      // hence called in else block
      i++;
    }
  }
  return nums;
}
