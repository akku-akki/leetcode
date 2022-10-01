import 'dart:math';

void main() {
  print(Solution().coinChange([186, 419, 83, 408], 6249));
}

class Solution {
  int coinChange(List<int> coins, int amount) {
    List<int?> memo = List.generate(amount + 1, (index) => null);
    return _countChange(coins, amount, memo);
  }

  int _countChange(List<int> coins, int amount, List<int?> memo) {
    if (amount == 0) {
      return 0;
    }

    int? result;
    for (int i = 0; i < coins.length; i++) {
      if (coins[i] <= amount) {
        int ans = 9999999999999;
        if (memo[amount - coins[i]] != null) {
          ans = memo[amount - coins[i]]!;
        } else {
          final count = _countChange(coins, amount - coins[i], memo);
          if (count == -1) {
            ans = -1;
          } else {
            ans = min(ans, count + 1);
          }
        }
      }
    }
    result ??= -1;
    memo[amount] = result;
    return memo[amount]!;
  }
}
