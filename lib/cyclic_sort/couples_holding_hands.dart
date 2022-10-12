void main() {
  print(Solution().minSwapsCouples([0, 2, 1, 3]));
}

class Solution {
  int minSwapsCouples(List<int> row) {
    int requiredSwaps = 0;
    List<int> temp = [...row];

    int i = 0;

    while (i < temp.length) {
      int correct = temp[i];
      if (temp[i] != temp[correct]) {
        requiredSwaps++;
        
      } else {}
    }

    return -1;
  }
}
