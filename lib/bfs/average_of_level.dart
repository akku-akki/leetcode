import 'dart:collection';

void main() {
  final root =
      TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)));
  // final root = TreeNode(
  //     1, TreeNode(2, TreeNode(4), null), TreeNode(3, null, TreeNode(5)));
  print(Solution().averageOfLevels(root));
}

class Solution {
  List<double> averageOfLevels(TreeNode? root) {
    if (root == null) return [];
    List<double> result = [];
    DoubleLinkedQueue<TreeNode> dQ = DoubleLinkedQueue();
    dQ.add(root);
    while (dQ.isNotEmpty) {
      int queueSize = dQ.length;
      int levelAverage = 0;
      for (int i = 0; i < queueSize; i++) {
        final node = dQ.removeFirst();
        if (node.left != null) {
          dQ.add(node.left!);
        }
        if (node.right != null) {
          dQ.add(node.right!);
        }
        levelAverage += node.val;
      }
      result.add(levelAverage / queueSize);
    }
    return result;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
