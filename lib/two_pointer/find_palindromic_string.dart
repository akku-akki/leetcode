void main() {
  print(Solution().firstPalindrome([
    "abc",
    "car",
    "ada",
    "racecar",
    "cool",
  ]));
}

class Solution {
  String firstPalindrome(List<String> words) {
    for (int i = 0; i < words.length; i++) {
      if (isPalindrome(words[i])) {
        return words[i];
      }
    }
    return '';
  }

  bool isPalindrome(String str) {
    int start = 0;
    int end = str.length - 1;
    while (start <= end) {
      if (str[start] == str[end]) {
        start++;
        end--;
      } else {
        return false;
      }
    }
    return true;
  }
}
