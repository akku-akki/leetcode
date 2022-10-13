import 'dart:collection';

void main() {
  TreeNode? node = TreeNode(
    3,
    null,
    TreeNode(20),
  );
  print(Solution().maxDepth(node));
}

class Solution {
  int maxDepth(TreeNode? root) {
    int depth = 0;
    if (root == null) return depth;
    DoubleLinkedQueue<TreeNode> queue = DoubleLinkedQueue();
    queue.addLast(root);
    while (queue.isNotEmpty) {
      int size = queue.length;
      depth++;
      while (size > 0) {
        TreeNode current = queue.removeFirst();
        if (current.left != null) {
          queue.addLast(current.left!);
        }
        if (current.right != null) {
          queue.addLast(current.right!);
        }
        size--;
      }
    }
    return depth;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
