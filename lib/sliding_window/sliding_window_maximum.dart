//239. Sliding Window Maximum

import 'dart:collection';

void main() {
  print(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
}

List<int> maxSlidingWindow(List<int> nums, int k) {
  DoubleLinkedQueue<int> dQ = DoubleLinkedQueue();
  List<int> result = [];
  final length = nums.length;
  for (int i = 0; i < length; i++) {
    if (dQ.isNotEmpty && dQ.elementAt(0) < i - k + 1) {
      dQ.removeFirst();
    }
    while (dQ.isNotEmpty && nums[dQ.lastEntry()!.element] < nums[i]) {
      dQ.removeLast();
    }
    dQ.addLast(i);
    if (i >= k - 1) {
      result.add(nums[dQ.elementAt(0)]);
    }
  }
  return result;
}
