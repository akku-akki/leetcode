void main() {
  print(findDuplicates([4, 3, 2, 7, 8, 2, 3, 1]));
}

List<int> findDuplicates(List<int> nums) {
  int i = 0;
  while (i < nums.length) {
    int correct = nums[i] - 1;
    if (nums[i] != nums[correct]) {
      int temp = nums[correct];
      nums[correct] = nums[i];
      nums[i] = temp;
    } else {
      i++;
    }
  }
  List<int> result = [];
  for (int index = 0; index < nums.length; index++) {
    if (nums[index] != index + 1) {
      result.add(nums[index]);
    }
  }
  return result;
}
