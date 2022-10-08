void main() {
  print(Solution().checkInclusion('ab', 'eidbaooo'));
}

class Solution {
  bool checkInclusion(String s1, String s2) {
    final s1Length = s1.length;
    final s2Length = s2.length;
    if (s1Length > s2Length) return false;
    List<int> lookUp = List.generate(26, (index) => 0);
    final aCode = 'a'.codeUnitAt(0);
    for (int i = 0; i < s1Length; i++) {
      lookUp[s1[i].codeUnitAt(0) - aCode]++;
    }

    for (int i = 0; i < s2Length; i++) {
      lookUp[s2[i].codeUnitAt(0) - aCode]--;
      if (i - s1Length >= 0) {
        lookUp[s2[i - s1Length].codeUnitAt(0) - aCode]++;
      }
      if (isAllZero(lookUp)) return true;
    }
    return false;
  }

  bool isAllZero(List<int> lookUp) {
    for (int i = 0; i < lookUp.length; i++) {
      if (lookUp[i] != 0) return false;
    }
    return true;
  }
}
