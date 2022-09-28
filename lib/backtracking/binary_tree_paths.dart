void main() {
  print(Solution().binaryTreePaths(
      TreeNode(1, TreeNode(2, null, TreeNode(5)), TreeNode(3))));
}

class Solution {
  List<String> binaryTreePaths(TreeNode? root) {
    final List<String> paths = [];
    final List<String> ans = [];
    _binaryTreePaths(root, paths, ans);
    return ans;
  }

  void _binaryTreePaths(
    TreeNode? node,
    List<String> paths,
    List<String> ans,
  ) {
    if (node == null) return;
    paths.add(node.val.toString());
    if (node.left == null && node.right == null) {
      ans.add(paths.join("->"));
    }
    _binaryTreePaths(node.left, paths, ans);
    _binaryTreePaths(node.right, paths, ans);
    paths.removeLast();
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
