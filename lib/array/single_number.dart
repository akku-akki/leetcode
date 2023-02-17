void main() {
  List<int> data = [2, 2, 1];
  print(Solution().singleNumber(data));
}

class Solution {
  int singleNumber(List<int> nums) {
    int currentNum = 0;

    for (int i = 0; i < nums.length; i++) {
      currentNum = currentNum ^ nums[i];
    }
    return currentNum;
  }
}
