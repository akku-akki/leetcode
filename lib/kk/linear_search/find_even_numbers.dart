import 'dart:math' as Math;

void main() {
  print(findNumbers([1000]));
}

int findNumbers(List<int> nums) {
  int evenCount = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i].toString().length % 2 == 0) {
      evenCount += 1;
    }
  }
  return evenCount;
}

