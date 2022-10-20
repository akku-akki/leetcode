void main() {
  print(Solution().allPathsSourceTarget([
    [1, 2],
    [3],
    [3],
    []
  ]));
}

class Solution {
  List<List<int>> allPathsSourceTarget(List<List<int>> graph) {
    List<List<int>> ans = [];
    List<int> path = [];
    getallPathsSourceTargetRec(graph, path, ans, 0);
    return ans;
  }

  void getallPathsSourceTargetRec(
    List<List<int>> graph,
    List<int> path,
    List<List<int>> ans,
    int cur,
  ) {
    path.add(cur);
    if (cur == graph.length - 1) {
      ans.add([...path]);
    } else {
      for (int element in graph[cur]) {
        getallPathsSourceTargetRec(graph, path, ans, element);
      }
    }
    path.removeLast();
    return;
  }
}
