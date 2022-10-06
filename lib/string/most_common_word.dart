void main() {
  print(Solution().mostCommonWord(
      'Bob hit a ball, the hit BALL flew far after it was hit.', ['hit']));
}

class Solution {
  String mostCommonWord(String paragraph, List<String> banned) {
    Map<String, int> countRecord = {};

    final wordsList =
        paragraph.toLowerCase().split("r'\w+'");
    print(wordsList);

    return '';
  }
}
