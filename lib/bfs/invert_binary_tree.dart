import 'dart:collection';

void main() {
  TreeNode? node = TreeNode(
    4,
    TreeNode(2, TreeNode(1), TreeNode(3)),
    TreeNode(7, TreeNode(6), TreeNode(9)),
  );

  // _getInOrderTraversal(node);
  node = Solution().invertTree(node);
  _getInOrderTraversal(node);
}

void _getInOrderTraversal(TreeNode? root) {
  if (root == null) return;
  _getInOrderTraversal(root.left);
  print(root.val);
  _getInOrderTraversal(root.right);
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? invertTree(TreeNode? root) {
    DoubleLinkedQueue<TreeNode?> queue = DoubleLinkedQueue<TreeNode?>();
    queue.addLast(root);
    while (queue.isNotEmpty) {
      TreeNode? current = queue.removeFirst();
      TreeNode? temp = current?.left;
      current?.left = current.right;
      current?.right = temp;
      if (current?.left != null) {
        queue.addLast(current!.left);
      }
      if (current?.right != null) {
        queue.addLast(current!.right);
      }
    }
    return root;
  }
}


// Recursion 
  // TreeNode? invertTree(TreeNode? root) {
  //   if (root == null) {
  //     return null;
  //   }
  //   TreeNode? left = invertTree(root.left);
  //   TreeNode? right = invertTree(root.right);
  //   root.left = right;
  //   root.right = left;
  //   return root;
  // }