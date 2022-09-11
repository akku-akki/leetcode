void main() {
  print(findDuplicate([1, 3, 4, 2, 2]));
}

int findDuplicate(List<int> nums) {
  int i = 0;
  while (i < nums.length) {
    if (nums[i] != i + 1) {
      int correct = nums[i] - 1;
      if (nums[i] != nums[correct]) {
        int temp = nums[correct];
        nums[correct] = nums[i];
        nums[i] = temp;
      } else {
        return nums[i];
      }
    } else {
      i++;
    }
  }

  return -1;
}
