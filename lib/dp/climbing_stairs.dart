void main() {
  print(Solution().climbStairs(2));
}

class Solution {
  int climbStairs(int n) {
    List<int?> memo = List.generate(
      n + 1,
      (index) => null,
    );
    print('N is $n and N Length => ${memo.length}');
    int result = _climbCount(n, memo);
    print(memo);
    return result;
  }

  int _climbCount(int n, List<int?> memo) {
    if (n < 2) {
      return 1;
    }
    if (memo[n] != null) {
      return memo[n]!;
    }
    int result = _climbCount(n - 1, memo) + _climbCount(n - 2, memo);
    memo[n] = result;
    return result;
  }
}
