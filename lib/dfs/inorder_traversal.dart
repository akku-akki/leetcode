void main() {
  final root = TreeNode(1, null, TreeNode(2, TreeNode(3)));
  print(Solution().inorderTraversal(root));
}

class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> _result = [];
    _getInOrderTraversal(root, _result);
    return _result;
  }
  void _getInOrderTraversal(TreeNode? root, List<int> result) {
    if (root == null) return;
    _getInOrderTraversal(root.left, result);
    result.add(root.val);
    _getInOrderTraversal(root.right, result);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
