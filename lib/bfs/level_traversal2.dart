import 'dart:collection';

void main() {
  final root =
      TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)));
  // final root = TreeNode(
  //     1, TreeNode(2, TreeNode(4), null), TreeNode(3, null, TreeNode(5)));
  print(Solution().levelOrder(root));
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> _result = [];
    if (root == null) return [];
    DoubleLinkedQueue<TreeNode> dQ = DoubleLinkedQueue();
    dQ.add(root);
    _result.add([root.val]);
    while (dQ.isNotEmpty) {
      final dqSize = dQ.length;
      List<int> _currentNodes = [];
      for (int i = 0; i < dqSize; i++) {
        final currentNode = dQ.removeFirst();

        if (currentNode.left != null) {
          dQ.add(currentNode.left!);
          _currentNodes.add(currentNode.left!.val);
        }

        if (currentNode.right != null) {
          dQ.add(currentNode.right!);
          _currentNodes.add(currentNode.right!.val);
        }
      }
      if (_currentNodes.isNotEmpty) {
        _result.add(_currentNodes);
      }
    }

    return _result.reversed.toList();
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
