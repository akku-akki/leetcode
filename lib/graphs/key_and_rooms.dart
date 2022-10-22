// leetcode  841
void main() {
  print(Solution().canVisitAllRooms([[1,3],[3,0,1],[2],[0]]));
}

class Solution {
  bool canVisitAllRooms(List<List<int>> rooms) {
    Set<int> visitedRooms = {};
    visitRoom(0, visitedRooms, rooms);
    for (int i = 0; i < rooms.length; i++) {
      if (!visitedRooms.contains(i)) {
        return false;
      }
    }
    return true;
  }

  void visitRoom(
    int room,
    Set<int> visitedRooms,
    List<List<int>> rooms,
  ) {
    if (visitedRooms.contains(room)) return;
    visitedRooms.add(room);
    final keys = rooms[room];
    for (final key in keys) {
      visitRoom(key, visitedRooms, rooms);
    }
  }
}
