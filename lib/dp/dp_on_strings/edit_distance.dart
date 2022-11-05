import 'dart:math';

void main() {
  print(Solution().minDistance("horse", "ros"));
}

class Solution {
  int minDistance(
    String word1,
    String word2,
  ) {
    Map<String, int> record = {};
    final key = word1 + '-' + word2;
    _minDistance(word1, word2, record);
    return record[key]!;
  }

  int _minDistance(String word1, String word2, Map<String, int> record) {
    final key = word1 + '-' + word2;
    if (word1.length == 0) {
      record[key] = word2.length;
      return record[key]!;
    }
    if (word2.length == 0) {
      record[key] = word1.length;
      return record[key]!;
    }
    if (record.containsKey(key)) return record[key]!;
    if (word1[0] == word2[0]) {
      record[key] =
          _minDistance(word1.substring(1), word2.substring(1), record);
      return record[key]!;
    } else {
      int replace =
          _minDistance(word1.substring(1), word2.substring(1), record);
      int insert = _minDistance(word1, word2.substring(1), record);
      int delete = _minDistance(word1.substring(1), word2, record);
      int ans = 1 + min(replace, min(insert, delete));
      record[key] = ans;
      return ans;
    }
  }
}
