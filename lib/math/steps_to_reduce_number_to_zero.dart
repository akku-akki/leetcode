void main() {
  print(Solution().numberOfSteps(8));
}

class Solution {
  int numberOfSteps(int num) {
    return stepCout(num, 0);
  }

  int stepCout(int num, int step) {
    if (num == 0) {
      return 0;
    }
    if (num % 2 == 0) {
      num = num ~/ 2;
      return stepCout(num, step) + 1;
    } else {
      num = num - 1;
      return stepCout(num, step) + 1;
    }
  }
}
