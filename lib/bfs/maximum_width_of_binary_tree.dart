import 'dart:collection' show DoubleLinkedQueue;
import 'dart:math';

void main() {
  TreeNode? node = TreeNode(
    1,
    TreeNode(3, TreeNode(5), TreeNode(3)),
    TreeNode(2, null, TreeNode(9)),
  );
  print(Solution().widthOfBinaryTree(node));
}

class Solution {
  int widthOfBinaryTree(TreeNode? root) {
    if (root == null || root.left == null && root.right == null) {
      return 1;
    }
    Map<TreeNode, int> map = {};
    map[root] = 0;
    DoubleLinkedQueue<TreeNode> queue = DoubleLinkedQueue();
    queue.addLast(root);
    int maxWidth = -1;
    while (queue.isNotEmpty) {
      int size = queue.length;
      int left = map[queue.first]!;
      while (size > 0) {
        TreeNode current = queue.removeFirst();
        maxWidth = max(maxWidth, map[current]! - left + 1);
        if (current.left != null) {
          queue.addLast(current.left!);
          map[current.left!] = 2 * (map[current]!);
        }
        if (current.right != null) {
          queue.addLast(current.right!);
          map[current.right!] = (2 * map[current]!) + 1;
        }
        size--;
      }
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
