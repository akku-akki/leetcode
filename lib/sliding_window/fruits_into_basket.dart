import '../test/debug_utils.dart/u.dart';

void main() {
  cPrintBg(output: Solution().totalFruit([3, 3, 3, 1, 4]), c: C.green);
}

class Solution {
  int totalFruit(List<int> fruits) {
    int lastFruit = -1;
    int secondLastFruit = -1;
    int lastFruitCount = 0;
    int currentMax = 0;
    int max = 0;

    for (final fruit in fruits) {
      if (fruit == lastFruit || fruit == secondLastFruit) {
        currentMax++;
      } else {
        currentMax = lastFruitCount + 1;
      }

      if (fruit == lastFruit) {
        lastFruitCount++;
      } else {
        lastFruitCount = 1;
        secondLastFruit = lastFruit;
        lastFruit = fruit;
      }
      max = max < currentMax ? currentMax : max;
    }
    return max;
  }
}
