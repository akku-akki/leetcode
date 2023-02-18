
// LC 921 

void main() {
  print(Solution().minAddToMakeValid("))"));
}

class Solution {
  int minAddToMakeValid(String s) {
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      if (s[i] == ')') {
        if (stack.isNotEmpty && stack.last == '(') {
          stack.removeLast();
        } else {
          stack.add(s[i]);
        }
      } else {
        stack.add(s[i]);
      }
    }
    return stack.length;
  }
}
