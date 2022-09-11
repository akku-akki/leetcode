
void main() {
  print(missingNumber([ 0, 1]));
}

int missingNumber(List<int> nums) {
  int start = 0;
  while (start < nums.length) {
    int number = nums[start];
    if ((number == nums.length)) {
      start++;
      continue;
    }
    if (!(number == start)) {
      int numberIndex = nums[number];
      int startIndex = nums[start];
      nums[number] = startIndex;
      nums[start] = numberIndex;
    } else {
      start++;
    }
  }

  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != i) {
      return i;
    }
  }
  return nums.length;
}
