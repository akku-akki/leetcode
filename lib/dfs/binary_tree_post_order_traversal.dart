

void main() {}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> postorderTraversal(TreeNode? root) {
    List<int> result = [];
    dfs(result, root);
    return result;
  }

  void dfs(List<int> result, TreeNode? root) {
    if (root == null) return;
    if (root.left != null) {
      dfs(result, root.left);
    }
    if (root.right != null) {
      dfs(result, root.right);
    }
     result.add(root.val);
  }
}
