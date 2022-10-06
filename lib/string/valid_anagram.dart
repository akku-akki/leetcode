void main() {
  print(Solution().isAnagram('anagram', 'nagaram'));
}

class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;
    List<int> record = List.generate(26, (index) => 0);
    for (int i = 0; i < s.length; i++) {
      int index = s[i].codeUnitAt(0) - 'a'.codeUnitAt(0);
      record[index]++;
    }
    for (int i = 0; i < t.length; i++) {
      int index = t[i].codeUnitAt(0) - 'a'.codeUnitAt(0);
      if (record[index] == 0) return false;
      record[index]--;
    }
    return true;
  }
}
