void main() {
  List<int> nums = [100, 30, 40, 6, 5, 4, 3, 2, 1];
  sort(nums, 0, nums.length - 1);
  print(nums);
}

void sort(
  List<int> nums,
  int low,
  int hi,
) {
  if (low >= hi) {
    return;
  }
  int s = low;
  int e = hi;

  int m = (low + hi) ~/ 2;
  int pivot = nums[m];
  while (s <= e) {
    while (nums[s] < pivot) {
      s++;
    }
    while (nums[e] > pivot) {
      e--;
    }
    if (s <= e) {
      int temp = nums[s];
      nums[s] = nums[e];
      nums[e] = temp;
      s++;
      e--;
    }
  }
  sort(nums, low, e);
  sort(nums, s, hi);
}
