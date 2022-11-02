void main() {
  print(Solution().letterCombinations('23'));
}

class Solution {
  List<String> letterCombinations(String digits) {
    List<String> ans = [];
    if (digits.length == 0) return ans;
    Map<String, String> keyMap = {};
    keyMap['2'] = "abc";
    keyMap['3'] = "def";
    keyMap['4'] = "ghi";
    keyMap['5'] = "jkl";
    keyMap['6'] = "mno";
    keyMap['7'] = "pqrs";
    keyMap['8'] = "tuv";
    keyMap['9'] = "wxyz";
    dial(digits, 0, keyMap, StringBuffer(), ans);
    return ans;
  }

  void dial(
    String digits,
    int i,
    Map<String, String> keyMap,
    StringBuffer currentDialed,
    List<String> ans,
  ) {
    if (i == digits.length) {
      ans.add(currentDialed.toString());
      return;
    }
    String curr = keyMap[digits[i]]!;
    for (int k = 0; k < curr.length; k++) {
      currentDialed.write(curr[k]);
      dial(digits, i + 1, keyMap, currentDialed, ans);
      final backtrackedResult = currentDialed.toString().substring(0, currentDialed.toString().length-1);
      currentDialed.clear();
      currentDialed.write(backtrackedResult);
    }
  }
}
