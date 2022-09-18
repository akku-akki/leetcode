import 'dart:collection';

void main() {
  final root = TreeNode(
    5,
    TreeNode(
      4,
      TreeNode(
        11,
        TreeNode(7),
        TreeNode(2),
      ),
    ),
    TreeNode(
      8,
      TreeNode(13),
      TreeNode(
        4,
        null,
        TreeNode(1),
      ),
    ),
  );
  print(Solution().hasPathSum(root, 22));
}

class Solution {
  bool hasPathSum(TreeNode? root, int targetSum) =>
      _hasPathSum(root, targetSum, 0);

  bool _hasPathSum(TreeNode? root, int targetSum, int currentSum) {
    if (root == null) return false;
    int nodeResult = root.val + currentSum;
    if (nodeResult == targetSum && root.left == null && root.right == null)
      return true;
    if (_hasPathSum(root.left, targetSum, nodeResult)) return true;
    return _hasPathSum(root.right, targetSum, nodeResult);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
