import '../test/debug_utils.dart/u.dart';

void main() {
  cPrintBg(output: Solution().lengthOfLastWord('Hello World'), c: C.red);
}

class Solution {
  int lengthOfLastWord(String s) => s.trim().split(' ').last.length;
}
