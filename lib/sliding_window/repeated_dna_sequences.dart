void main() {
  print(
    Solution().findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"),
  );
}

class Solution {
  List<String> findRepeatedDnaSequences(String s) {
    Set<String> dna = {};
    final repeatedDna = <String>{};
    int start = 0;
    int end = 9;
    while (end < s.length) {
      final dnaCopy = s.substring(start, end + 1);
      if (!dna.add(dnaCopy)) {
        repeatedDna.add(dnaCopy);
      }
      start++;
      end++;
    }
    return repeatedDna.toList();
  }
}

// class Solution {
//   List<String> findRepeatedDnaSequences(String s) {
//     Set<String> dna = {};
//     final repeatedDna = <String>{};
//     for (int i = 0; i + 9 < s.length; i++) {
//       final dnaPattern = s.substring(i, i + 10);
//       if (!dna.add(dnaPattern)) {
//         repeatedDna.add(dnaPattern);
//       } 
//     }
//     return repeatedDna.toList();
//   }
// }
