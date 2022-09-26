import 'dart:collection';

void main() {
  print(Solution().findOrder(4, [
    [1, 0],
    [2, 0],
    [3, 1],
    [3, 2]
  ]));
}

class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    Set<int> all = {};
    for (int i = 0; i < numCourses; i++) {
      all.add(i);
    }
    Set<int> visiting = {};
    Set<int> visited = {};
    DoubleLinkedQueue<int> stack = DoubleLinkedQueue<int>();

    final List<List<int>> graph = List.generate(
      numCourses,
      (index) => [],
    );

    for (int i = 0; i < prerequisites.length; i++) {
      graph[prerequisites[i][1]].add(prerequisites[i][0]);
    }

    while (all.isNotEmpty) {
      int current = all.first;
      if (hasCycle(current, all, visiting, visited, graph, stack)) {
        return [];
      }
    }
    List<int> sortedOrderCourse = [];
    while (stack.isNotEmpty) {
      sortedOrderCourse.add(stack.removeFirst());
    }
    return sortedOrderCourse;
  }
}

bool hasCycle(int node, Set<int> all, Set<int> visiting, Set<int> visited,
    List<List<int>> prerequisites, DoubleLinkedQueue<int> stack) {
  all.remove(node);
  visiting.add(node);
  final List<int> nodes =
      node < prerequisites.length ? prerequisites[node] : [];
  for (final currentNode in nodes) {
    if (visited.contains(currentNode)) continue;
    if (visiting.contains(currentNode)) return true;
    final result =
        hasCycle(currentNode, all, visiting, visited, prerequisites, stack);
    if (result) {
      return true;
    }
  }
  visiting.remove(node);
  visited.add(node);
  stack.addFirst(node);
  return false;
}
