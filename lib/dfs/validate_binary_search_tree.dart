void main() {
  final root = TreeNode(2, TreeNode(1), TreeNode(3));
  final root2 = TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6)));
  print(Solution().isValidBST(root2));
}

class Solution {
  bool isValidBST(TreeNode? root) {
    return _isValidBST(
      root,
      -9999999999999,
      9999999999999,
    );
  }

  bool _isValidBST(TreeNode? root, int? min, int? max) {
    if (root == null) return true;
    if ((max != null && root.val >= max) || (min != null && root.val <= min))
      return false;
    return _isValidBST(root.left, min, root.val) &&
        _isValidBST(root.right, root.val, max);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
