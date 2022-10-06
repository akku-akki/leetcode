void main() {
  List<String> alphabets = ["H","a","n","n","a","h"];
  Solution().reverseString(alphabets);
  print(alphabets);
}

class Solution {
  void reverseString(List<String> s) {
    int start = 0;
    int end = s.length - 1;

    while (start <= end) {
      swap(s, start, end);
      start++;
      end--;
    }
  }

  void swap(List<String> s, int start, int end) {
    final temp = s[start];
    s[start] = s[end];
    s[end] = temp;
  }
}
