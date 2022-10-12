void main() {
  print(
    Solution().eraseOverlapIntervals(
      [
        [1, 2],
        [2, 3],
        [3, 4],
        [1, 3]
      ],
    ),
  );
}

class Solution {
  int eraseOverlapIntervals(List<List<int>> intervals) {
    intervals.sort(
      (a, b) => a[0].compareTo(b[0]),
    );
    print(intervals);
    return -1;
  }
}
