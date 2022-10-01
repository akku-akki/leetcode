import 'dart:math' as Math;

void main() {
  print(Solution().numRollsToTarget(30, 30, 500));
}

class Solution {
    int mod = (1000000000 + 7);

  int numRollsToTarget(int n, int k, int target) {
    List<int?> memo = List.generate(target + 1, (index) => null);
    return getNumRollToTarget(n, k, target, memo);
  }

  int getNumRollToTarget(int n, int k, int target, List<int?> memo) {
    if (target < n || target > n * k) return 0;
    if (n == 1) return target <= k ? 1 : 0;
    int sum = 0;
    for (int i = 1; i <= k; i++) {
      if (memo[target - i] != null) {
        sum = ((sum % mod) + (memo[target - i]! % mod)) % mod;
      } else {
        sum =
            ((sum % mod) + (getNumRollToTarget(n - 1, k, target - i, memo) % mod)) % mod;
      }
    }
    memo[target] = sum % mod;
    return sum % mod;
  }
}
