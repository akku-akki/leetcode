import 'dart:math' as Math;

void main() {
  print(insert([
    // [1, 2],
    // [3, 5],
    // [6, 7],
    // [8, 10],
    // [12, 16]
    [1, 3], [6, 9]
  ], [
    // 4,
    // 8
    2, 5
  ]));
}

List<List<int>> insert(
  List<List<int>> intervals,
  List<int> newInterval,
) {
  List<List<int>> result = [];
  bool handelNewInterval = false;

  for (int i = 0; i < intervals.length; i++) {
    if ( handelNewInterval || intervals[i][1] < newInterval[0]) {
      result.add([intervals[i][0], intervals[i][1]]);
    } else if (intervals[i][0] > newInterval[1]) {
      result.add(newInterval);
      result.add([intervals[i][0], intervals[i][1]]);
      handelNewInterval = true;
    } else {
      newInterval[0] = Math.min(newInterval[0], intervals[i][0]);
      newInterval[1] = Math.max(newInterval[1], intervals[i][1]);
    }
  }
  if (!handelNewInterval) {
    result.add(newInterval);
  }
  return result;
}
