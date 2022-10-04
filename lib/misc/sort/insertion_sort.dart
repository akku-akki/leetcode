void main() {
  List<int> nums = [9, 8, 7, 6, 6, 6, 5, 4, 4, 4, 3, 2, 1];
  insertionSort(nums);
  print(nums);
}

void insertionSort(List<int> nums) {
  for (int i = 1; i < nums.length; i++) {
    int current = nums[i];
    int j = i - 1;
    while (j >= 0 && nums[j] > current) {
      nums[j + 1] = nums[j];
      j--;
    }
    print('ARRAY AFTER SHIFITNG => $nums');
    nums[j + 1] = current;
  }
}
