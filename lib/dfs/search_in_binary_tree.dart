// LC 700

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void main() {}

class Solution {
  TreeNode? searchBST(TreeNode? root, int val) {
    if (root == null) {
      return root;
    } else {
      if (root.val == val)
        return root;
      else {
        if (root.val > val) {
          return searchBST(root.left, val);
        } else {
          return searchBST(root.right, val);
        }
      }
    }
  }
}
