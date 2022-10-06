void main() {
  print(Solution().rotateString('abcde', 'cdeab'));
}

class Solution {
  bool rotateString(String s, String goal) =>
      (s.length != goal.length && (s + s).contains(goal));
}
