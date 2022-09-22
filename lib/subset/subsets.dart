void main() {
  print(Solution().subsets([1, 2, 3]));
}

class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> _result = [[]];
    for (int data in nums) {
      final length = _result.length;
      for (int i = 0; i < length; i++) {
        final _internalResult = [..._result[i]];
        _internalResult.add(data);
        _result.add(_internalResult);
      }
    }
    return _result;
  }
}
