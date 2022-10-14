import 'dart:collection' show DoubleLinkedQueue;

void main() {
  TreeNode? node = TreeNode(
    1,
    TreeNode(
      3,
      TreeNode(5, TreeNode(6)),
    ),
    TreeNode(
      2,
      null,
      TreeNode(9, TreeNode(7)),
    ),
  );
  print(Solution().widthOfBinaryTree(node));
}

class Solution {
  int widthOfBinaryTree(TreeNode? root) {
    DoubleLinkedQueue<TreeNode?> queue = DoubleLinkedQueue();
    queue.addLast(root!);
    int maxWidth = -1;
    while (queue.isNotEmpty) {
      int size = queue.length;
      maxWidth = maxWidth < size ? size : maxWidth;
      while (size > 0) {
        TreeNode? current = queue.removeFirst();
        queue.addLast(current?.left);
        queue.addLast(current?.right);
        size--;
      }
      while (queue.isNotEmpty && queue.first == null) queue.removeFirst();
      while (queue.isNotEmpty && queue.last == null) queue.removeLast();
    }
    return maxWidth;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
