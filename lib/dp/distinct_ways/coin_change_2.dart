void main() {
  print(Solution().change(10, [1, 2, 5]));
}

class Solution {
  int change(int amount, List<int> coins) {
    Map<String, int> record = {};
    return _getChange(0, amount, coins, record);
  }

  int _getChange(
    int start,
    int amount,
    List<int> coins,
    Map<String, int> record,
  ) {
    if (amount == 0) return 1;
    if (amount < 0) return 0;
    final key = '$amount' + '${coins[start]}';
    if (record.containsKey(key)) {
      return record[key]!;
    }
    int sum = 0;
    for (int i = start; i < coins.length; i++) {
      sum = sum + _getChange(i, amount - coins[i], coins, record);
    }
    record.putIfAbsent(key, () => sum);
    return sum;
  }
}
