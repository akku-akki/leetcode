import 'dart:math';

void main() {
  TreeNode? node = TreeNode(
    3,
    TreeNode(9),
    TreeNode(20, TreeNode(15), TreeNode(7)),
  );
  print(Solution().maxDepth(node));
}

class Solution {
  int maxDepth(TreeNode? root) =>
      root == null ? 0 : max(maxDepth(root.left), maxDepth(root.right)) + 1;
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
