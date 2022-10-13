import 'dart:math';

void main() {
  TreeNode? node = TreeNode(
    2,
    TreeNode(22),
    TreeNode(3, null, TreeNode(4, null, TreeNode(5, null, TreeNode(6)))),
  );
  print(Solution().minDepth(node));
}

class Solution {
  int minDepth(TreeNode? root) {
    if (root == null) return 0;
    if (root.left == null && root.right == null) return 1;
    int left = 9999999999999;
    int right = 9999999999999;
    // IGNORE ROOT LEFT if its null
    // because it will give 0 which will be min
    // and ignore other possiblity
    // Also PATH IS TILL LEAF NOAD WHICH WILL HAVE BOTH RIGHT AND LEFT NULL
    if (root.left != null) {
      left = minDepth(root.left);
    }
    if (root.right != null) {
      right = minDepth(root.right);
    }
    return min(left, right) + 1;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
