void main() {
  print(Solution().mySqrt(8));
}

class Solution {
  int mySqrt(int x) {
    int low = 1;
    int high = x;
    int ans = -1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      int sqr = mid * mid;

      if (sqr == x)
        return mid;
      else if (sqr < x) {
        ans = mid;
        low = mid + 1;
      } else {
        high = mid - 1;
      }
    }

    return ans;
  }
}
