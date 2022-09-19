void main() {
  final root = TreeNode(2, TreeNode(1), TreeNode(3));
  final root2 = TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6)));
  print(Solution().isValidBST(root2));
}


class Solution {
  bool isValidBST(TreeNode? root) => _isValidBST(root, -999999, 999999);

  bool _isValidBST(TreeNode? root, int min, int max) {
    if (root == null) return true;
    if (root.val < min || root.val > max) return false;
    return _isValidBST(root.left, min, root.val - 1) &&
        _isValidBST(root.right, root.val + 1, max);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
