void main() {
  print(Solution().findAnagrams('cbaebabacd', 'abc'));
}

class Solution {
  List<int> findAnagrams(String s, String p) {
    int sLength = s.length;
    int pLength = p.length;
    if (sLength < pLength) return [];
    List<int> pFreq = List.generate(26, (index) => 0);
    List<int> window = List.generate(26, (index) => 0);
    for (int i = 0; i < pLength; i++) {
      int index1 = p[i].codeUnitAt(0) - 'a'.codeUnitAt(0);
      int index2 = s[i].codeUnitAt(0) - 'a'.codeUnitAt(0);
      pFreq[index1]++;
      window[index2]++;
    }
    final List<int> ans = [];
    if (isEqual(pFreq, window)) {
      ans.add(0);
    }
    for (int i = pLength; i < sLength; i++) {
      window[s[i - pLength].codeUnitAt(0) - 'a'.codeUnitAt(0)]--;
      window[s[i].codeUnitAt(0) - 'a'.codeUnitAt(0)]++;
      if (isEqual(pFreq, window)) {
        ans.add(i - pLength + 1);
      }
    }
    return ans;
  }

  bool isEqual(List l1, List l2) {
    if (l1.length != l2.length) return false;
    for (int i = 0; i < l1.length; i++) {
      if (l1[i] != l2[i]) {
        return false;
      }
    }
    return true;
  }
}
