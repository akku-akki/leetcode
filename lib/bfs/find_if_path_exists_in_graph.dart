import 'dart:collection';

void main() {
  print(Solution().validPath(
      6,
      [
        [0, 1],
        [0, 2],
        [3, 5],
        [5, 4],
        [4, 3]
      ],
      0,
      5));
}

class Solution {
  bool validPath(int n, List<List<int>> edges, int source, int destination) {
    if (source == destination) return true;
    Map<int, List<int>> graph = {};
    for (int i = 0; i < n; i++) {
      graph[i] = [];
    }
    for (int i = 0; i < edges.length; i++) {
      final list = edges[i];
      final node1 = graph[list[0]]!;
      node1.add(list[1]);
      final node2 = graph[list[1]]!;
      node2.add(list[0]);
    }
    Set<int> visited = {};
    DoubleLinkedQueue<int> toVisit = DoubleLinkedQueue();
    toVisit.addLast(source);
    while (toVisit.isNotEmpty) {
      final current = toVisit.removeFirst();
      if (visited.contains(current)) continue;
      if (current == destination) return true;
      for (final nodes in graph[current]!) {
        toVisit.addLast(nodes);
      }
      visited.add(current);
    }
    return visited.contains(destination);
  }
}
