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

class Solution {
  List<int> findMinHeightTrees(int n, List<List<int>> edges) {
    Set<int> all = {};
    for (int i = 0; i < n; i++) {
      all.add(i);
    }
    Set<int> visiting = {};
    Set<int> visited = {};

    final List<List<int>> graph = List.generate(
      n,
      (index) => [],
    );
    print(graph);
    for (int i = 0; i < edges.length; i++) {
      final list = edges[i];
      graph[list[0]].add(list[1]);
      graph[list[1]].add(list[0]);
    }
    print(graph);
    
    while (all.isNotEmpty) {
      int current = all.first;
      if (hasCycle(current, all, visiting, visited, graph)) {
        return [];
      }
    }
    return [];
  }
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
