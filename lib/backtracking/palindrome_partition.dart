import '../test/debug_utils.dart/u.dart';

void main() {
  print(Solution().partition('aab'));
}

class Solution {
  List<List<String>> partition(String s) {
    List<List<String>> ans = [];
    _partition(s, [], ans, 0);
    return ans;
  }

  void _partition(
      String s, List<String> temp, List<List<String>> ans, int start) {
    if (start == s.length) {
      ans.add([...temp]);
      return;
    }
    for (int i = start; i < s.length; i++) {
      final subString = s.substring(start, i + 1);
      if (isPalindrome(subString)) {
        temp.add(subString);
        _partition(s, temp, ans, i + 1);
        temp.removeLast();
      }
    }
  }

  bool isPalindrome(String word) {
    int start = 0;
    int end = word.length - 1;

    while (start <= end) {
      if (word[start] != word[end]) {
        return false;
      }
      start++;
      end--;
    }

    return true;
  }
}
