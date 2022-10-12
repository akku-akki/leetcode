void main() {}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSymmetric(TreeNode? root) {
    if (root == null) return true;
    return isMirror(root.left, root.right);
  }

  bool isMirror(TreeNode? rootA, TreeNode? rootB) {
    if (rootA == null && rootB == null) return true;
    if (rootA != null && rootB != null) {
      return rootA.val == rootB.val &&
          isMirror(rootA.left, rootB.right) &&
          isMirror(rootA.right, rootB.left);
    } else {
      return false;
    }
  }
}
