void main() {
  List<int> nums = [
    9,
    8,
    7,
    6,
  ];
  selectionSort(nums);
  print(nums);
}

void selectionSort(List<int> nums) {
  //Outer loop to swap the minNumber found by index
  for (int i = 0; i < nums.length; i++) {
    int minIndex = i;
    //Inner loop to find smallest number
    for (int j = i; j < nums.length; j++) {
      if (nums[j] < nums[minIndex]) {
        minIndex = j;
      }
    }
    int temp = nums[minIndex];
    nums[minIndex] = nums[i];
    nums[i] = temp;
  }
}
