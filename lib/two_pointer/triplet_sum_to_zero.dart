void main() {
  print(threeSum([-1, 0, 1, 2, -1, -4]));
}

List<List<int>> threeSum(List<int> nums) {
  List<List<int>> result = [];
  nums.sort();

  for (int i = 0; i < nums.length - 2; i++) {
    if (i > 0 && nums[i] == nums[i - 1]) {
      continue;
    }
    searchWindowPair(i, nums, result);
  }
  return result;
}

void searchWindowPair(
  int index,
  List<int> nums,
  List<List<int>> result,
) {
  int targetSum = -nums[index];
  int startIndex = index + 1;
  int endIndex = nums.length - 1;
  while (startIndex < endIndex) {
    final currentSum = nums[startIndex] + nums[endIndex];
    if (targetSum == currentSum) {
      result.add([nums[index], nums[startIndex], nums[endIndex]]);
      startIndex++;
      endIndex--;
      while (
          startIndex < endIndex && nums[startIndex] == nums[startIndex - 1]) {
        startIndex++;
      }
      while (startIndex < endIndex && nums[endIndex] == nums[endIndex + 1]) {
        endIndex--;
      }
    } else if (targetSum > currentSum) {
      startIndex++;
    } else {
      endIndex--;
    }
  }
}
