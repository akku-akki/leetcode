void main() {
  List<int> nums = [9, 8, 7, 6, 6, 6, 5, 4, 4, 4, 3, 2, 1];
  mergeSort(nums);
  print(nums);
}

void mergeSort(List<int> nums) {
  if (nums.length < 2) return;
  int mid = nums.length ~/ 2;
  List<int> left = List<int>.generate(mid, (index) => 0);
  for (int i = 0; i < mid; i++) {
    left[i] = nums[i];
  }
  List<int> right = List<int>.generate(
    nums.length - mid,
    (index) => 0,
  );
  for (int i = mid; i < nums.length; i++) {
    right[i - mid] = nums[i];
  }
  mergeSort(left);
  mergeSort(right);
  merge(left, right, nums);
}

void merge(List<int> left, List<int> right, List<int> nums) {
  int i = 0, j = 0, k = 0;
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      nums[k] = left[i];
      k++;
      i++;
    } else {
      nums[k] = right[j];
      k++;
      j++;
    }
  }

  while (i < left.length) {
    nums[k] = left[i];
    k++;
    i++;
  }

  while (j < right.length) {
    nums[k] = right[j];
    k++;
    j++;
  }
}
