import 'dart:math';

import '../test/debug_utils.dart/u.dart';

void main() {
  cPrintBg(
      output: Solution().findClosestElements([1, 2, 3, 4, 5], 4, 3), c: C.red);
  cPrintBg(
      output: Solution().findClosestElements([1, 1, 1, 10, 10, 10], 1, 9),
      c: C.green);
}

class Solution {
  List<int> findClosestElements(List<int> arr, int k, int x) {
    List<int> result = [];
    int n = arr.length;
    if (x <= arr[0]) {
      return getSubArray(result, arr, 0, k - 1);
    } else if (x >= arr[n - 1]) {
      return getSubArray(result, arr, n - k, n - 1);
    } else {
      int index = getClosestIndex(arr, x);
      int low = max(0, index - k);
      int high = min(n - 1, index + k);
      while (high - low + 1 > k) {
        if (low < 0 || ((x - arr[low]) <= (arr[high] - x))) {
          --high;
        } else if (high >= n - 1 || ((arr[high] - x) < (x - arr[low]))) {
          ++low;
        } else {
          break;
        }
      }

      return getSubArray(result, arr, low, high);
    }
  }

  int getClosestIndex(List<int> arr, int x) {
    int start = 0;
    int end = arr.length - 1;

    while (start + 1 <= end) {
      int mid = start + (end - start) ~/2;
      if (arr[mid] < x) {
        start = mid + 1;
      } else {
        end = mid;
      }
    }
    return arr[start] >= x ? start : end;
  }

  List<int> getSubArray(List<int> res, List<int> arr, int start, int end) {
    for (int i = start; i <= end; i++) {
      res.add(arr[i]);
    }
    return res;
  }
}
