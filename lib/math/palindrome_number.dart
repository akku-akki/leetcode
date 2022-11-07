void main() {
  print(Solution().isPalindrome(-12121));
}

class Solution {
  bool isPalindrome(int x) {
    int originalNum = x;
    int temp = x;
    int length = 0;
    int newNum = 0;
    if (length == 1) return true;
    while (temp > 0) {
      length++;
      temp = temp ~/ 10;
    }
    while (length >= 0) {
      int last = (x % 10);
      newNum = (newNum * (length > 0 ? 10 : 1)) + last;
      x = x ~/ 10;
      length--;
    }
    return originalNum == newNum;
  }
}
