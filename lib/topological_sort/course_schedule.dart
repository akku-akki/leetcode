void main() {
  print(
    Solution().canFinish(
      20,
      [
        [0, 10],
        [3, 18],
        [5, 5],
        [6, 11],
        [11, 14],
        [13, 1],
        [15, 1],
        [17, 4]
      ],
    ),
  );
}

class Solution {
  bool canFinish(int vertices, List<List<int>> edges) {
    Set<int> all = {};
    for (int i = 0; i < vertices; i++) {
      all.add(i);
    }
    Set<int> visiting = {};
    Set<int> visited = {};

    final List<List<int>> graph = List.generate(
      vertices,
      (index) => [],
    );

    for (int i = 0; i < edges.length; i++) {
      graph[edges[i][1]].add(edges[i][0]);
    }

    while (all.isNotEmpty) {
      int current = all.first;
      if (hasCycle(current, all, visiting, visited, graph)) {
        return false;
      }
    }
    return true;
  }

  bool hasCycle(
    int node,
    Set<int> all,
    Set<int> visiting,
    Set<int> visited,
    List<List<int>> edges,
  ) {
    all.remove(node);
    visiting.add(node);
    final List<int> nodes = node < edges.length ? edges[node] : [];
    for (final currentNode in nodes) {
      if (visited.contains(currentNode)) continue;
      if (visiting.contains(currentNode)) return true;
      final result = hasCycle(currentNode, all, visiting, visited, edges);
      if (result) {
        return true;
      }
    }
    visiting.remove(node);
    visited.add(node);
    return false;
  }
}
