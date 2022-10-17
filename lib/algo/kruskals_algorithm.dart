// algorithm Kruskal(G) is
//     F:= ∅
//     for each v ∈ G.V do
//         MAKE-SET(v)
//     for each (u, v) in G.E ordered by weight(u, v), increasing do
//         if FIND-SET(u) ≠ FIND-SET(v) then
//             F:= F ∪ {(u, v)} ∪ {(v, u)}
//             UNION(FIND-SET(u), FIND-SET(v))
//     return F

void main() {
  //1. find the minimum edge of all
  //2. check if the edge create cycle
  //3. if not include it in mst
  //4. repeat till there are v-1 egdes.

  int noOfVertices = 5;
  List<int> parent = List.generate(
    noOfVertices,
    (index) => -1,
  );

  // make self as a parent
  for (int i = 0; i < noOfVertices; i++) {
    parent[i] = i;
  }

  List<List<int>> adj = [];
  //Source destination weight
  adj.add([0, 1, 4]);
  adj.add([0, 2, 1]);
  adj.add([1, 2, 2]);
  adj.add([1, 4, 5]);
  adj.add([2, 3, 4]);
  adj.add([3, 4, 3]);

  int edgeCount = 0;
  int find(int i) {
    // self is not the parent
    while (parent[i] != i) {
      i = parent[i];
    }
    return i;
  }

  void union(int a, int b) {
    int x = find(a);
    int y = find(b);
    parent[x] = parent[y];
  }

  while (edgeCount < noOfVertices - 1) {
    int min = 99999999999999999;
    List<int> minEdge = [min, min, min];
    for (final edge in adj) {
      print(edge);
      // check if cycle exists or not
      if (find(edge[0]) != find(edge[1]) && min > edge[2]) {
        minEdge = edge;
        min = edge[2];
      }
    }
    union(minEdge[0], minEdge[1]);
    edgeCount++;
  }
}
