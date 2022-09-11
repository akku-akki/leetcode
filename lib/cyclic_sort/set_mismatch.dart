void main() {
  print(findErrorNums([2, 2]));
}

List<int> findErrorNums(List<int> nums) {
  int i = 0;
  while (i < nums.length) {
    int correct = nums[i] - 1;
    if (nums[i] < nums.length && nums[i] != nums[correct]) {
      int temp = nums[correct];
      nums[correct] = nums[i];
      nums[i] = temp;
    } else {
      i++;
    }
  }

  for (int index = 0; index < nums.length; index++) {
    if (nums[index] != index + 1) {
      return [nums[index], index + 1];
    }
  }
  return [-1, -1];
}

// List<int> findErrorNums(List<int> nums) {
//   int n = nums.length;
//   int dup = -1, miss = -1;

//   for (int i = 1; i <= n; ++i) {
//     int count = 0;
//     for (int num in nums) {
//       if (num == i) {
//         count += 1;
//       }
//     }
//     if (count == 2) dup = i;
//     if (count == 0) miss = i;
//     if (dup > 0 && miss > 0) break;
//   }
//   return [dup, miss];
// }
