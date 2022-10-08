void main() {
  print(Solution().lengthOfLongestSubstring("qrsvbspk"));
}

class Solution {
  int lengthOfLongestSubstring(String s) {
    int endIndex = 0;
    Set<String> currentSubString = {};
    int stringLength = s.length;
    int maxSubStringLength = 0;

    while (endIndex < stringLength) {
      if (currentSubString.contains(s[endIndex])) {
        final char = s[endIndex];
        int index = 0;
        while (currentSubString.elementAt(index) != char) {
          index++;
        }
        while (index >= 0) {
          final indexChar = currentSubString.elementAt(index);
          currentSubString.remove(indexChar);
          index--;
        }
        currentSubString.add(s[endIndex]);
        endIndex++;
        if (maxSubStringLength < currentSubString.length) {
          maxSubStringLength = currentSubString.length;
        }
      } else {
        currentSubString.add(s[endIndex]);
        endIndex++;
        if (maxSubStringLength < currentSubString.length) {
          maxSubStringLength = currentSubString.length;
        }
      }
    }

    return maxSubStringLength;
  }
}
