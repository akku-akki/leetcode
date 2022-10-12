// CONVERT  CODE TO KOTLIN AND SUBMIT

void main() {
  TreeNode? node = TreeNode(
    3,
    TreeNode(
      5,
      TreeNode(6),
      TreeNode(
        2,
        TreeNode(7),
        TreeNode(4),
      ),
    ),
    TreeNode(
      1,
      TreeNode(0),
      TreeNode(8),
    ),
  );
  print(lowestCommonAncestor(node, TreeNode(5), TreeNode(1))!.val);
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

TreeNode? lowestCommonAncestor(
  TreeNode? root,
  TreeNode? p,
  TreeNode? q,
) {
  if (root == null) return root;
  print('THIS IS ROOT VALUE ${root.val}');
  if (root.val == p!.val || root.val == q!.val) {
    return root;
  }
  TreeNode? left = lowestCommonAncestor(root.left, p, q);
  TreeNode? right = lowestCommonAncestor(root.right, p, q);
  if (left != null && right != null) return root;
  return left != null ? left : right;
}
