//LC 389 Find the difference
//
void main() {
  print(Solution().findTheDifference('ab', 'aa'));
}

class Solution {
  String findTheDifference(String s, String t) {
    List<int> frequency = List.generate(
      26,
      (_) => 0,
    );

    for (int i = 0; i < s.length; i++) {
      final charIndex = s[i].codeUnits[0] - 97;
      frequency[charIndex]++;
    }

    for (int j = 0; j < t.length; j++) {
      final charIndex = t[j].codeUnits[0] - 97;
      frequency[charIndex]--;
    }
    print(frequency);

    for (int k = 0; k < frequency.length; k++) {
      if (frequency[k] < 0) {
        print(k);
        return String.fromCharCode((k + 97));
      }
    }

    return '';
  }
}
