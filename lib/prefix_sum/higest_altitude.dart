void main() {
  print(Solution().largestAltitude([-4,-3,-2,-1,4,3,2]));
}

class Solution {
  int largestAltitude(List<int> gain) {
    final prefixSum = List.generate(gain.length + 1, (index) => 0);
    prefixSum[1] = gain[0];
    for (int i = 1; i <= gain.length; i++) {
      prefixSum[i] = gain[i - 1] + prefixSum[i - 1];
    }
    int max = 0;
    for (int i = 1; i < prefixSum.length; i++) {
      if (max < prefixSum[i]) {
        max = prefixSum[i];
      }
    }
    return max;
  }
}
