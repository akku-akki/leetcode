//Given an array nums of n integers where nums[i]
//is in the range [1, n], return an array of all
//the integers in the range [1, n] that do not
//appear in nums.

void main() {
  print(findDisappearedNumbers([4, 3, 2, 7, 8, 2, 3, 1]));
}

List<int> findDisappearedNumbers(List<int> nums) {
  int index = 0;

  while (index < nums.length) {
    int correctNumber = nums[index] - 1;
    if (nums[index] != nums[correctNumber]) {
      int temp = nums[correctNumber];
      nums[correctNumber] = nums[index];
      nums[index] = temp;
    } else {
      index++;
    }
  }
  List<int> result = [];
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != i + 1) {
      result.add(i + 1);
    }
  }

  return result;
}
