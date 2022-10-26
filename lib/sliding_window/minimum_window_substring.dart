void main() {
  print(Solution().minWindow('ADOBECODEBANC', 'ABC'));
}

class Solution {
  String minWindow(String s, String t) {
    String ans = '';
    Map<String, int> freqT = {};
    Map<String, int> freqCurr = {};

    for (int i = 0; i < t.length; i++) {
      if (freqT.containsKey(t[i])) {
        freqT[t[i]] = freqT[t[i]]! + 1;
      } else {
        freqT[t[i]] = 1;
      }
      
    }
    int currentDensity = 0;
    int expectedDensity = t.length;

    int i = -1;
    int j = -1;

    while (true) {
      bool f1 = false;
      bool f2 = false;

      while (i < s.length - 1 && currentDensity < expectedDensity) {
        i++;
        String char = s[i];
        if (freqCurr.containsKey(char)) {
          freqCurr[char] = freqCurr[char]! + 1;
        } else {
          freqCurr[char] = 1;
        }
        if ((freqCurr[char] ?? 0) <= (freqT[char] ?? 0)) {
          currentDensity++;
        }
        f1 = true;
      }

      while (j < i && currentDensity == expectedDensity) {
        final word = s.substring(j + 1, i + 1);
        if (ans.length == 0 || word.length < ans.length) {
          ans = word;
        }
        j++;
        String ch = s[j];
        if (freqCurr[ch]! == 1) {
          freqCurr.remove(ch);
        } else {
          freqCurr[ch] = freqCurr[ch]! - 1;
        }
        if ((freqCurr[ch] ?? 0) < (freqT[ch] ?? 0)) {
          currentDensity--;
        }
        f2 = true;
      }

      if (f1 == false && f2 == false) {
        break;
      }
    }

    return ans;
  }
}
