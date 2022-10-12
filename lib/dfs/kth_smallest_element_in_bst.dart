void main() {
  TreeNode? node = TreeNode(
    3,
    TreeNode(1, null, TreeNode(2)),
    TreeNode(4),
  );
  print(Solution().kthSmallest(node, 1));
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  late int result;
  late int count;
  int kthSmallest(TreeNode? root, int k) {
    count = k;
    kthSmallestELement(root);
    return result;
  }

  void kthSmallestELement(TreeNode? root) {
    if (root == null) return;
    kthSmallestELement(root.left);
    count--;
    if (count == 0) {
      result = root.val;
      return;
    }
    kthSmallestELement(root.right);
  }
}
