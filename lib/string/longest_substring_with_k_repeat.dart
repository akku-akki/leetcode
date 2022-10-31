import 'dart:math';

void main() {
  print(Solution().longestSubstring('ababbc', 2));
}

class Solution {
  int longestSubstring(String s, int k) {
    int n = s.length;
    if (n == 0 || n < k) return 0;
    if (k <= 1) return n;
    Map<String, int> count = {};
    for (int i = 0; i < n; i++) {
      if (count.containsKey(s[i])) {
        count[s[i]] = count[s[i]]! + 1;
      } else {
        count[s[i]] = 1;
      }
    }
    int l = 0;
    while (l < n && count[s[l]]! >= k) l++;
    if (l >= n - 1) return l;
    int ls1 = longestSubstring(s.substring(0, l), k);
    while (l < n && count[s[l]]! < k) l++;
    int ls2 = l < n ? longestSubstring(s.substring(l), k) : 0;
    return max(ls1, ls2);
  }
}
