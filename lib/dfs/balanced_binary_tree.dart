import 'dart:math';

void main() {}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isBalanced(TreeNode? root) {
    return root == null ? true : getPartHeight(root) != -1;
  }

  int getPartHeight(TreeNode? root) {
    if (root == null) return 0;
    final leftHeight = getPartHeight(root.left);
    final rightHeight = getPartHeight(root.right);
    if ( leftHeight == -1 || rightHeight == -1 || ( leftHeight - rightHeight).abs() > 1) {
      return -1;
    }
    return max(leftHeight, rightHeight) + 1;
  }
}
