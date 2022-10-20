void main() {
  print(Solution().eventualSafeNodes([
    [1, 2],
    [2, 3],
    [5],
    [0],
    [5],
    [],
    []
  ]));
}

class Solution {
  List<int> eventualSafeNodes(List<List<int>> graph) {
    List<int> result = [];
    List<bool> presentCycle = List.generate(graph.length, (index) => false);
    List<bool> visited = List.generate(graph.length, (index) => false);
    List<bool> visiting = List.generate(graph.length, (index) => false);

    for (int i = 0; i < graph.length; i++) {
      if (!visited[i]) {
        dfsRec(i, visited, visiting, presentCycle, graph);
      }
    }

    for (int i = 0; i < graph.length; i++) {
      if (!presentCycle[i]) {
        result.add(i);
      }
    }
    return result;
  }

  bool dfsRec(
    int node,
    List<bool> visited,
    List<bool> visiting,
    List<bool> presentCycle,
    List<List<int>> graph,
  ) {
    visited[node] = true;
    visiting[node] = true;
    List<int> edges = graph[node];

    for (final element in edges) {
      if (!visited[element]) {
        if (dfsRec(element, visited, visiting, presentCycle, graph)) {
          return presentCycle[node] = true;
        }
      }else if (visited[element] && visiting[element]) {
        return presentCycle[node] = true;
      }
    }
    visiting[node] = false;
    return false;
  }
}
