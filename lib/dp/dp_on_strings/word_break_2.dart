void main() {
  print(Solution()
      .wordBreak('catsanddog', ["cat", "cats", "and", "sand", "dog"]));
}

class Solution {
  List<String> wordBreak(String s, List<String> wordDict) {
    Set<String> book = {}..addAll(wordDict);
    Map<int, List<String>> record = {};
    final result = wordBreakHelper(s, 0, book, record);
    print(record);
    return result;
  }

  List<String> wordBreakHelper(
      String s, int start, Set<String> book, Map<int, List<String>> record) {
    if (record.containsKey(start)) return record[start]!;
    List<String> validSubstr = [];
    print(validSubstr);
    if (start == s.length) validSubstr.add("");
    print(validSubstr);
    for (int end = start + 1; end <= s.length; end++) {
      final prefix = s.substring(start, end);
      if (book.contains(prefix)) {
        List<String> suffixes = wordBreakHelper(s, end, book, record);
        for (String suffix in suffixes) {
          validSubstr.add(prefix + (suffix == "" ? "" : " ") + suffix);
        }
      }
    }
    record[start] = validSubstr;
    return validSubstr;
  }
}
