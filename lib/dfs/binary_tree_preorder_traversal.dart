void main() {}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> preorderTraversal(TreeNode? root) {
    List<int> result = [];
    dfs(result, root);
    return result;
  }

  void dfs(List<int> result, TreeNode? root) {
    if (root == null) return;
    result.add(root.val);
    if (root.left != null) {
      dfs(result, root.left);
    }
    if (root.right != null) {
      dfs(result, root.right);
    }
  }
}
