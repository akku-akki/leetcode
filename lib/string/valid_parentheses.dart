import 'dart:collection';

void main() {
  print(Solution().isValid('()[]{}'));
}

class Solution {
  bool isValid(String s) {
    DoubleLinkedQueue<String> stack = DoubleLinkedQueue();

    for (int i = 0; i < s.length; i++) {
      if (stack.isEmpty) {
        stack.add(s[i]);
      } else if ((stack.first == '{' && s[i] == '}') ||
          (stack.first == '[' && s[i] == ']') ||
          (stack.first == '(' && s[i] == ')')) {
        stack.removeFirst();
      } else {
        stack.addFirst(s[i]);
      }
    }
    if (stack.length == 0) return true;
    return false;
  }
}
