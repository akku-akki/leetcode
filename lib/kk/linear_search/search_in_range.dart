void main() {
  List<int> data = [
    0,
    9,
    6,
    5,
    3,
    8,
    2,
  ];
  int target = 8;
  int start = 2;
  int end = data.length - 1;
  print(searchInRange(data, target, start, end));
}

int searchInRange(List<int> nums, int target, int start, int end) {
  if (nums.length == 0) return -1;

  for (int i = start; i <= end; i++) {
    if (nums[i] == target) {
      return i;
    }
  }
  return -1;
}
