void main() {
  print(Solution().letterCasePermutation('JcTNPT1AsvC'));
}

class Solution {
  List<String> letterCasePermutation(String s) {
    List<String> _result = [];
    _result.add(s);
    for (int i = 0; i < s.length; i++) {
      int length = _result.length;
      if (!_isNumeric(s[i])) {
        for (int j = 0; j < length; j++) {
          String letter = _result[j];
          final newLetter = changeCapitalizationAtIndex(letter, i);
          _result.add(newLetter);
        }
      }
    }
    return _result;
  }

  String changeCapitalizationAtIndex(
    String s,
    int index,
  ) {
    int availableIndex = s.length - 1;
    print(availableIndex);
    String result = '';
    if (s == '') return '';
    if (index > availableIndex) {
      throw 'range error';
    }
    String first = s.substring(0, index);
    String mid = index < availableIndex
        ? s.substring(index, index + 1)
        : s[availableIndex];
    String last = index < availableIndex ? s.substring(index + 1) : '';
    final validChar = mid;
    if (validChar.toUpperCase() == validChar) {
      result = first + mid.toLowerCase() + last;
    } else {
      result = first + mid.toUpperCase() + last;
    }
    return result;
  }

  bool _isNumeric(String str) => int.tryParse(str) != null;
}