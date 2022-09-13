import 'dart:math' as Math;

void main() {
  print(splitArray([], 1));
}

int splitArray(List<int> nums, int m) {
  int start = 0;
  int end = 0;

  for (int i = 0; i < nums.length; i++) {
    start = Math.max(start, nums[i]);
    end += nums[i];
  }

  while (start < end) {
    int mid = (start + end) ~/ 2;

    int sum = 0;
    int pieces = 1;
    for (int num in nums) {
      if (sum + num > mid) {
        sum = num;
        pieces++;
      } else {
        sum += num;
      }
    }
    if (pieces > m) {
      start = mid + 1;
    } else {
      end = mid;
    }
  }

  return end; // here start == end
}
