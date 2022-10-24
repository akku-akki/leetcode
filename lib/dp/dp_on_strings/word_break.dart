void main() {
  print(
      Solution().wordBreak('catsandog', ["cats", "dog", "sand", "and", "cat"]));
}

class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    Set<String> book = {};
    wordDict.forEach((element) => book.add(element));
    Map<String, bool> record = {};
    final result = canBreak(s, book, record);
    return result;
  }

  bool canBreak(String s, Set<String> book, Map<String, bool> record) {
    if (record.containsKey(s)) return record[s]!;
    if (s == '') return true;
    for (int i = 0; i < s.length; i++) {
      if (book.contains(s.substring(0, i + 1)) &&
          canBreak(s.substring(i + 1), book, record)) {
        record[s.substring(i + 1)] = true;
        return true;
      }
    }
    record[s] = false;
    return false;
  }
}
