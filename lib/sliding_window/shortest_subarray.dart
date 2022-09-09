import 'dart:collection';
import 'dart:math' as Math;

void main() {
  print(shortestSubarray([84, -37, 32, 40, 95], 167));
}

int shortestSubarray(List<int> nums, int k) {
  // need to work on solution
  return 0;
}

//// Works only for +ve numbers

// int shortestSubarray(List<int> nums, int k) {
//   int maxPositive = 99999999999999;
//   int startWindow = 0;
//   int shortestLength = maxPositive;
//   int sum = 0;

//   for (int endWindow = 0; endWindow < nums.length; endWindow++) {
//     sum = sum + nums[endWindow];
//     while (sum >= k) {
//       int windowLength = (endWindow - startWindow) + 1;
//       shortestLength = Math.min(shortestLength, windowLength);
//       sum = sum - nums[startWindow];

//       startWindow++;
//     }
//   }
//   return shortestLength == maxPositive ? -1 : shortestLength;
// }
