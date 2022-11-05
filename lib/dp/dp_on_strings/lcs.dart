import 'dart:math';

void main() {
  print(Solution().longestCommonSubsequence("abc", "def"));
  // print(Solution().longestCommonSubsequence("abc", "def"));
}

class Solution {
  int longestCommonSubsequence(String text1, String text2) {
    Map<String, int> lookUp = {};
    _getLongestCommonSubsequence(text1, text2, 0, 0, lookUp);
    return lookUp['00']!;
  }

  int _getLongestCommonSubsequence(
    String text1,
    String text2,
    int i,
    int j,
    Map<String, int> lookUp,
  ) {
    if (i >= text1.length || j >= text2.length) return 0;
    final key = '$i$j';
    if (lookUp.containsKey(key)) {
      return lookUp[key]!;
    }
    if (text1[i] == '' || text2[j] == '') {
      lookUp[key] = 0;
      return lookUp[key]!;
    } else if (text1[i] == text2[j]) {
      lookUp[key] =
          1 + _getLongestCommonSubsequence(text1, text2, i + 1, j + 1, lookUp);
      return lookUp[key]!;
    } else {
      lookUp[key] = max(
        _getLongestCommonSubsequence(text1, text2, i + 1, j, lookUp),
        _getLongestCommonSubsequence(text1, text2, i, j + 1, lookUp),
      );
      return lookUp[key]!;
    }
  }
}
