import 'dart:collection';

void main() {
  print(
    Solution().findMinHeightTrees(
      6,
      [
        [3, 0],
        [3, 1],
        [3, 2],
        [3, 4],
        [5, 4]
      ],
    ),
  );
}
import 'dart:collection';

class Solution {
  List<int> findMinHeightTrees(int n, List<List<int>> edges) {
    Map<int, int> degree = {};
    DoubleLinkedQueue queue = DoubleLinkedQueue();
    final List<List<int>> graph = List.generate(
      n,
      (index) => [],
    );
    for (int i = 0; i < edges.length; i++) {
      final list = edges[i];
      graph[list[0]].add(list[1]);
      graph[list[1]].add(list[0]);
      degree.update(list[0], (value) => ++value, ifAbsent: (() => 1));
      degree.update(list[1], (value) => ++value, ifAbsent: (() => 1));
    }

    degree.forEach((key, value) {
      if (value == 1) {
        queue.addFirst(key);
      }
    });

    final List<int> ans = [];

    while (queue.isNotEmpty) {
      final size = queue.length;
      print(queue);
      ans.clear();
      for (int i = 0; i < size; i++) {
        int current = queue.removeFirst();
        ans.add(current);
        print(graph[current]);
        for (int child in graph[current]) {
          degree.update(child, (value) => --value);
          if (degree[child]! == 1) {
            queue.addLast(child);
          }
        }
      }
    }
    if (n == 1) ans.add(0);
    return ans;
  }
}
