void main() {
  print(Solution().backspaceCompare("xywrrmp", "xywrrmu#p"));
}

class Solution {
  bool backspaceCompare(String s, String t) {
    int index1 = s.length - 1;
    int index2 = t.length - 1;
    while (index1 >= 0 || index2 >= 0) {
      int i1 = getNextIndex(s, index1);
      int i2 = getNextIndex(t, index2);
      if (i1 < 0 && i2 < 0) return true;
      if (i1 < 0 || i2 < 0) return false;
      if (s[i1] != t[i2]) return false;
      index1 = i1 - 1;
      index2 = i2 - 1;
    }
    return true;
  }

  int getNextIndex(String s, int index) {
    int backspace = 0;
    while (index >= 0) {
      if (s[index] == '#') {
        backspace++;
      } else if (backspace > 0) {
        backspace--;
      } else {
        break;
      }
      index--;
    }
    return index;
  }
}


// class Solution {
//   bool backspaceCompare(String s, String t) {
//     DoubleLinkedQueue<String> stack = DoubleLinkedQueue();
//     StringBuffer sNew = StringBuffer('');
//     StringBuffer tNew = StringBuffer('');
//     for (int i = 0; i < s.length; i++) {
//       if (s[i] == '#') {
//         if (stack.isNotEmpty) {
//           stack.removeFirst();
//         }
//       } else {
//         stack.addFirst(s[i]);
//       }
//     }

//     while (stack.isNotEmpty) {
//       sNew.write(stack.removeLast());
//     }

//     for (int i = 0; i < t.length; i++) {
//       if (t[i] == '#') {
//         if (stack.isNotEmpty) {
//           stack.removeFirst();
//         }
//       } else {
//         stack.addFirst(t[i]);
//       }
//     }

//     while (stack.isNotEmpty) {
//       tNew.write(stack.removeLast());
//     }
//     return sNew.toString() == tNew.toString();
//   }
// }
