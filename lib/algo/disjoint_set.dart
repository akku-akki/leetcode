void main() {
  DisjointSet ds = new DisjointSet();
  ds.makeSet(1);
  ds.makeSet(2);
  ds.makeSet(3);
  ds.makeSet(4);
  ds.makeSet(5);
  ds.makeSet(6);
  ds.makeSet(7);

  ds.union(1, 2);
  ds.union(2, 3);
  ds.union(4, 5);
  ds.union(6, 7);
  ds.union(5, 6);
  ds.union(3, 7);

  print(ds.findSet(1));
  print(ds.findSet(2));
  print(ds.findSet(3));
  print(ds.findSet(4));
  print(ds.findSet(5));
  print(ds.findSet(6));
  print(ds.findSet(7));

}

/**
 * * For m operations and total n elements time complexity is O(m*f(n)) where f(n) is 
 * very slowly growing function. For most cases f(n) <= 4 so effectively
 * total time will be O(m). Proof in Coreman book.
 */

class Node {
  int data;
  Node? parent;
  int rank;

  Node(this.data, this.parent, this.rank);
}

class DisjointSet {
  Map<int, Node> record = {};

// Create a set with only one element
  void makeSet(int data) {
    Node node = Node(data, null, 0);
    node.parent = node;
    record[data] = node;
  }

// combines two set to one
// returns true if data1 and data2 are in differentset
// before union else false;
  bool union(int data1, int data2) {
    Node node1 = record[data1]!;
    Node node2 = record[data2]!;

    //if they are part of same set do nothing
    Node parent1 = _findSet(node1);
    Node parent2 = _findSet(node2);

    if (parent1.data == parent2.data) {
      return false;
    }

    //else whoever's rank is higher becomes parent of other
    if (parent1.rank >= parent2.rank) {
      //increment rank only if both sets have same rank
      parent1.rank =
          (parent1.rank == parent2.rank) ? parent1.rank + 1 : parent1.rank;
      parent2.parent = parent1;
    } else {
      parent1.parent = parent2;
    }
    return true;
  }

  /**
     * Finds the representative of this set
     */
  int findSet(int data) {
    return _findSet(record[data]!).data;
  }

/**
     * Find the representative recursively and does path
     * compression as well.
     */
  Node _findSet(Node node) {
    Node parent = node.parent!;
    if (parent == node) {
      return parent;
    }
    node.parent = _findSet(node.parent!);
    return node.parent!;
  }
}
