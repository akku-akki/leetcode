void main() {
  print(removeDuplicates([1, 1, 1]));
}

int removeDuplicates(List<int> nums) {
  int previousData = nums[0];

  int startIndex = 1;
  int endIndex = nums.length - 1;

  while (startIndex <= endIndex) {
    if (previousData == nums[startIndex]) {
      nums.removeAt(startIndex);
      endIndex--;
    } else {
      previousData = nums[startIndex];
      startIndex++;
    }
  }
  return nums.length;
}
