void main() {
  final root = TreeNode(
    5,
    TreeNode(4, TreeNode(11, TreeNode(7), TreeNode(2))),
    TreeNode(8, TreeNode(13), TreeNode(4, TreeNode(5), TreeNode(1))),
  );
  print(Solution().pathSum(root, 22));
}

class Solution {
  List<List<int>> _result = [];
  List<List<int>> pathSum(TreeNode? root, int targetSum) {
    getPath(root, targetSum, []);
    return _result;
  }

  void getPath(
    TreeNode? root,
    int targetSum,
    List<int> currentList,
  ) {
    if (root == null) return;
    currentList.add(root.val);
    if (root.val == targetSum && root.left == null && root.right == null) {
      _result.add(currentList);
      return;
    }
    getPath(root.left, targetSum - root.val, []..addAll(currentList));
    getPath(root.right, targetSum - root.val, []..addAll(currentList));
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
