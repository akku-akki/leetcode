void main() {
  print(Solution().capitalizeTitle('capiTalIze tHe titLe'));
  print(Solution().capitalizeTitle('First leTTeR of EACH Word'));
  print(Solution().capitalizeTitle('i lOve leetcode'));
}

class Solution {
  String capitalizeTitle(String title) {
    List<String> words = title.split(' ');
    print(words);
    for (int i = 0; i < words.length; i++) {
      final tempWord = words[i];
      int tempWordLength = tempWord.length;
      if (tempWordLength <= 2) {
        words[i] = tempWord.toLowerCase();
      } else {
        words[i] = capitalize(words[i]);
      }
    }
    return words.join(" ");
  }

  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}
