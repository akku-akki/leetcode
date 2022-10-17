import '../algo/disjoint_set.dart';

void main() {
  print(
    Solution().validPath(
        3,
        [
          [0, 1],
          [1, 2],
          [2, 0]
        ],
        0,
        2),
  );
}

class Solution {
  bool validPath(
    int n,
    List<List<int>> edges,
    int source,
    int destination,
  ) {
    DisjointSet ds = DisjointSet();
    int noOfVertex = n;
    List<int> parent = List.generate(
      n,
      (index) => -1,
    );
    print(parent);
    for (int i = 0; i < n; i++) {
      ds.makeSet(i);
    }
    int edges = 1;
    while (edges <= n) {
      edges++;
    }

    return false;
  }
}
