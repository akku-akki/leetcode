void main() {
  print(Solution().fizzBuzz(5));
}

class Solution {
  List<String> fizzBuzz(int n) {
    List<String> _result = [];
    for (int i = 1; i <= n; i++) {
      if (i % 3 == 0 && i % 5 == 0) {
        _result.add('FizzBuzz');
      } else if (i % 5 == 0) {
        _result.add('Buzz');
      } else if (i % 3 == 0) {
        _result.add('Fizz');
      } else {
        _result.add(i.toString());
      }
    }
    return _result;
  }
}
