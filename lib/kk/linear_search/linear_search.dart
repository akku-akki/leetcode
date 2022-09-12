void main() {
  final data = [45, 67, 34, 2, 4, 7, 46, 88];
  int target = 0;
  print(linearSearch(data, target));
}

/// Search for index
int linearSearch(List<int> nums, int target) {
  if (nums.length == 0) return -1;

  for (int index = 0; index < nums.length; index++) {
    int element = nums[index];
    if (element == target) {
      return index;
    }
  }
  return -1;
}
