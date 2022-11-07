void main() {
  print(Solution().plusOne([1, 2, 3]));
}

class Solution {
  List<int> plusOne(List<int> digits) {
    for (int i = digits.length - 1; i >= 0; i--) {
      if (digits[i] == 9) {
        digits[i] = 0;
      } else {
        digits[i]++;
        return digits;
      }
    }
    return [1, ...digits];
  }
}
