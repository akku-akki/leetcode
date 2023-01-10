// LC 387
void main() {
  print(Solution().firstUniqChar('aabb'));
}

class Solution {
  int firstUniqChar(String s) {
    List<int> frequency = List.generate(
      26,
      (_) => 0,
    );
    for (int i = 0; i < s.length; i++) {
      final charIndex = s[i].codeUnits[0] - 97;
      frequency[charIndex]++;
    }
    for (int i = 0; i < s.length; i++) {
      final charIndex = s[i].codeUnits[0] - 97;
      frequency[charIndex];
      if (frequency[charIndex] == 1) {
        return i;
      }
    }
    return -1;
  }
}
