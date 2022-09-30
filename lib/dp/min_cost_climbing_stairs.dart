import 'dart:math' as Math;

void main() {
  print(Solution().minCostClimbingStairs([10, 15, 20]));
}

class Solution {
  int minCostClimbingStairs(List<int> cost) {
    List<int?> memo = List.generate(cost.length, (index) => null);
    final fromZero = _getMinCost(0, cost, memo);
    final fromOne = _getMinCost(1, cost, memo);
    return Math.min(fromOne, fromZero);
  }

  int _getMinCost(int index, List<int> cost, List<int?> memo) {
    print(index);
    if (index == cost.length - 1 || index == cost.length - 2) {
      return cost[index];
    }
    if (memo[index] != null) {
      return memo[index]!;
    }
    final costLeft = _getMinCost(index + 1, cost, memo);
    final costRight = _getMinCost(index + 2, cost, memo);
    final min = Math.min(costLeft, costRight) + cost[index];
    memo[index] = min;
    return memo[index]!;
  }
}
