void main() {
  print(Solution().findCircleNum([
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
  ]));
}

class Solution {
  int findCircleNum(List<List<int>> isConnected) {
    Set<int> isVisited = {};
    int count = 0;
    for (int i = 0; i < isConnected.length; i++) {
      if (!isVisited.contains(i)) {
        count++;
        _dfsVisit(i, isVisited, isConnected);
      }
    }
    return count;
  }

  void _dfsVisit(
    int current,
    Set<int> isVisited,
    List<List<int>> isConnected,
  ) {
    isVisited.add(current);
    final list = isConnected[current];
    for (int i = 0; i < list.length; i++) {
      if (i == current) continue;
      if (list[i] == 1 && !isVisited.contains(i)) {
        _dfsVisit(i, isVisited, isConnected);
      }
    }
    return;
  }
}
