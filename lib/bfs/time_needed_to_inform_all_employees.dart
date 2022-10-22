import 'dart:collection';
import 'dart:math';

void main() {
  print(Solution().numOfMinutes(
    7,
    6,
    [1, 2, 3, 4, 5, 6, -1],
    [0, 6, 5, 4, 3, 2, 1],
  ));
}

class Solution {
  int ans = 0;
  int mx = 0;
  Map<int, List<int>> graph = {};

  int numOfMinutes(
    int n,
    int headID,
    List<int> manager,
    List<int> informTime,
  ) {
    for (int i = 0; i < n; i++) {
      if (manager[i] != -1) {
        if (graph.containsKey(manager[i])) {
          graph[manager[i]]!.add(i);
        } else {
          graph[manager[i]] = [i];
        }
      }
    }
    _numOfMinutes(headID, informTime);
    return mx;
  }

  void _numOfMinutes(int manager, List<int> informTime) {
    mx = max(mx, ans);
    for (final employee in graph[manager] ?? []) {
      ans += informTime[manager];
      _numOfMinutes(employee, informTime);
      ans = ans - informTime[manager];
    }
  }
}
