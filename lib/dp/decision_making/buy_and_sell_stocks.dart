import 'dart:math';

void main() {
  print(Solution().maxProfit([7, 1, 5, 3, 6, 4]));
}

class Solution {
  int max = 9999999999999;
  int maxProfit(List<int> prices) {
    int minVal = max;
    int maxProfit = 0;
    for (int i = 0; i < prices.length; i++) {
      if (prices[i] < minVal) {
        minVal = prices[i];
      } else if (prices[i] - minVal > maxProfit) {
        maxProfit = prices[i] - minVal;
      }
    }
    return maxProfit;
  }
}
