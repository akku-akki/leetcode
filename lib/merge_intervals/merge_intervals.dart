import 'dart:math' as Math;

void main() {
  print(merge(
    [
      [1, 4],
      [5, 6]
    ],
    // [[1,4], [2,5], [7,9]]
  ));
}

List<List<int>> merge(List<List<int>> intervals) {
  if (intervals.length < 2) return intervals;
  List<List<int>> mergedResult = [];
  intervals.sort(
    (a, b) => a[0].compareTo(b[0]),
  );
  int start = intervals[0][0];
  int end = intervals[0][1];
  for (int i = 1; i < intervals.length; i++) {
    if (intervals[i][0] <= end) {
      end = Math.max(intervals[i][1], end);
    } else {
      mergedResult.add([start, end]);
      start = intervals[i][0];
      end = intervals[i][1];
    }
  }
  mergedResult.add([start, end]);
  return mergedResult;
}
