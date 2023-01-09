// LC 404

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void main() {
  print(
    Solution().sumOfLeftLeaves(
      TreeNode(
        3,
        TreeNode(9),
        TreeNode(
          20,
          TreeNode(15),
          TreeNode(7),
        ),
      ),
    ),
  );
}

class Solution {
  int sum = 0;
  int sumOfLeftLeaves(TreeNode? root) {
    helper(root);
    return sum;
  }

  void helper(TreeNode? node) {
    if (node == null) return;
    if (isLeafNode(node.left)) {
      sum = node.left!.val + sum;
    }
    helper(node.left);
    helper(node.right);
  }

  bool isLeafNode(TreeNode? node) {
    if (node == null) return false;
    return (node.left == null && node.right == null);
  }
}
