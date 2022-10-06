import 'dart:collection';
// 1081. Smallest Subsequence of Distinct Characters

void main() {
  print(Solution().smallestSubsequence('cbacdcbc'));
}

class Solution {
  String smallestSubsequence(String s) {
    final aCode = 'a'.codeUnitAt(0);
    List<int> freqList = List.generate(26, (index) => 0);
    for (int i = 0; i < s.length; ++i) {
      freqList[s[i].codeUnitAt(0) - aCode]++;
    }
    DoubleLinkedQueue<String> stack = DoubleLinkedQueue();
    List<bool> seen = List.generate(
      26,
      (index) => false,
    );
    for (int i = 0; i < s.length; ++i) {
      if (seen[s[i].codeUnitAt(0) - aCode]) {
        freqList[s[i].codeUnitAt(0) - aCode]--;
        continue;
      }
      while (!stack.isEmpty &&
          stack.first.codeUnitAt(0) > s[i].codeUnitAt(0) &&
          freqList[stack.first.codeUnitAt(0) - aCode] > 0) {
        seen[stack.first.codeUnitAt(0) - aCode] = false;
        stack.removeFirst();
      }
      stack.addFirst(s[i]);
      seen[s[i].codeUnitAt(0) - aCode] = true;
      freqList[s[i].codeUnitAt(0) - aCode]--;
    }
    String ans = '';
    while (!stack.isEmpty) {
      ans = ans + stack.removeLast();
    }
    return ans;
  }
}
