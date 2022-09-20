void main() {
  final root = TreeNode(
      1, TreeNode(2, null, TreeNode(5)), TreeNode(3, null, TreeNode(4)));
  print(Solution().rightSideView(root));
}

class Solution {
  List<int> result = [];

  List<int> rightSideView(TreeNode? root) {
    getRightSideView(root, 0);
    return result;
  }

  void getRightSideView(TreeNode? root, int depth) {
    if (root == null) return;
    if (result.length == depth) {
      result.add(root.val);
    }
    getRightSideView(root.right, depth + 1);
    getRightSideView(root.left, depth + 1);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
