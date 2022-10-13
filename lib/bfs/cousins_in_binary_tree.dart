import 'dart:collection';

void main() {
  TreeNode? node = TreeNode(
    1,
    TreeNode(2, null, TreeNode(4)),
    TreeNode(
      3,
      null,
      TreeNode(5),
    ),
  );

  print(Solution().isCousins(node, 2, 3));
}

class Solution {
  bool isCousins(TreeNode? root, int x, int y) {
    DoubleLinkedQueue<TreeNode> queue = DoubleLinkedQueue();
    queue.addLast(root!);
    bool xReceived = false;
    bool yReceived = false;
    int? xParent;
    int? yParent;
    bool isResultFound = false;
    while (queue.isNotEmpty) {
      int size = queue.length;
      if (xReceived || yReceived) {
        isResultFound = false;
        break;
      }
      while (size > 0) {
        TreeNode current = queue.removeFirst();
        if (current.left != null) {
          queue.add(current.left!);
          if (current.left!.val == x) {
            xReceived = true;
            xParent = current.val;
          } else if (current.left!.val == y) {
            yReceived = true;
            yParent = current.val;
          }
        }
        if (current.right != null) {
          queue.add(current.right!);
          if (current.right!.val == y) {
            yReceived = true;
            yParent = current.val;
          } else if (current.right!.val == x) {
            xReceived = true;
            xParent = current.val;
          }
        }
        if ((xReceived && yReceived) && xParent != yParent) {
          queue.clear();
          isResultFound = true;
          break;
        }
        if ((xReceived && yReceived) && xParent == yParent) {
          queue.clear();
          isResultFound = false;
          break;
        }
        size--;
      }
    }
    return isResultFound;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
