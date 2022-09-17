// ignore_for_file: unnecessary_null_comparison

import 'dart:collection';

void main() {
  final root1 =
      TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)));
  final root2 = TreeNode(
      1, TreeNode(2, TreeNode(4), null), TreeNode(3, null, TreeNode(5)));
  final node = Solution().mergeTrees(root1, root2);
  DoubleLinkedQueue<TreeNode> dQ = DoubleLinkedQueue();
  dQ.add(node!);
  while (dQ.isNotEmpty) {
    final tempNode = dQ.removeFirst();
    if (tempNode.left != null) {
      dQ.add(tempNode.left!);
    }
    if (tempNode.right != null) {
      dQ.add(tempNode.right!);
    }
    print(tempNode.val);
  }
}

class Solution {
  TreeNode? mergeTrees(TreeNode? root1, TreeNode? root2) {
    if (root1 == null) return root2;
    if (root2 == null) return root1;
    return TreeNode(
      root1.val + root2.val,
      mergeTrees(root1.left, root2.left),
      mergeTrees(root1.right, root2.right),
    );
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
