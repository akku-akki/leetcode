void main() {
  final root = TreeNode(
    10,
    TreeNode(
      5,
      TreeNode(3, TreeNode(3), TreeNode(-2)),
      TreeNode(
        2,
        null,
        TreeNode(1),
      ),
    ),
    TreeNode(
      -3,
      null,
      TreeNode(11),
    ),
  );
  print(Solution().pathSum(root, 8));
}

class Solution {
  int total = 0;
  int pathSum(TreeNode? root, int targetSum) {
    if (root == null) return 0;
    getPathSum(root, targetSum, 0);
    pathSum(root.left, targetSum);
    pathSum(root.right, targetSum);
    return total;
  }

  void getPathSum(TreeNode? root, int sum, int currentSum) {
    if (root == null) return;
    currentSum = currentSum + root.val;
    if (sum == currentSum) {
      total += 1;
    }
    getPathSum(root.left, sum, currentSum);
    getPathSum(root.right, sum, currentSum);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
