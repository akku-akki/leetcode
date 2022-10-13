
import 'dart:collection';

void main() {
  TreeNode? node1 = TreeNode(1, TreeNode(2), TreeNode(1));
  TreeNode? node2 = TreeNode(1, TreeNode(1), TreeNode(2));
  print(Solution().isSameTree(node1, node2));
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

// class Solution {
//   bool isSameTree(TreeNode? p, TreeNode? q) {
//     if (p == null && q == null) return true;
//     if (p == null || q == null) return false;
//     return p.val == q.val && isSameTree(p.left, q.left) && isSameTree(p.right, q.right);
//   }
// }



class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    if (p == null && q == null) return true;
    if (p == null || q == null) return false;
    DoubleLinkedQueue<TreeNode> pQueue = DoubleLinkedQueue<TreeNode>();
    DoubleLinkedQueue<TreeNode> qQueue = DoubleLinkedQueue<TreeNode>();
    pQueue.addLast(p);
    qQueue.addLast(q);
    while (pQueue.isNotEmpty && qQueue.isNotEmpty) {
      TreeNode pNode = pQueue.removeFirst();
      TreeNode qNode = qQueue.removeFirst();
      if (pNode.val != qNode.val) return false;
      if (pNode.left != null && qNode.left != null) {
        pQueue.addLast(pNode.left!);
        qQueue.addLast(qNode.left!);
      }
      if (pNode.right != null && qNode.right != null) {
        pQueue.addLast(pNode.right!);
        qQueue.addLast(qNode.right!);
      }
      if ((pNode.left == null) ^ (qNode.left == null)) return false;
      if ((pNode.right == null) ^ (qNode.right == null)) return false;
    }
    return true;
  }
}
