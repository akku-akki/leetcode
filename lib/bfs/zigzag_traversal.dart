import 'dart:collection';

void main() {
  // final root = TreeNode(3, TreeNode(9, TreeNode(80), TreeNode(70)),
  //     TreeNode(20, TreeNode(15), TreeNode(7)));
  final root = TreeNode(
      1, TreeNode(2, TreeNode(4), null), TreeNode(3, null, TreeNode(5)));
  print(Solution().zigzagLevelOrder(root));
}

class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    if (root == null) return [];
    DoubleLinkedQueue<TreeNode> dQ = DoubleLinkedQueue();
    List<List<int>> _zigzagResult = [];
    bool isLTR = false;
    dQ.add(root);
    _zigzagResult.add([root.val]);
    while (dQ.isNotEmpty) {
      final dqSize = dQ.length;
      List<int> currentLevelResult = [];
      int counter = isLTR == true ? dqSize : 0;
      if (isLTR == true) {
        while (counter > 0) {
          final currentNode = dQ.removeLast();
          if (currentNode.left != null) {
            dQ.addFirst(currentNode.left!);
            currentLevelResult.add(currentNode.left!.val);
          }
          if (currentNode.right != null) {
            dQ.addFirst(currentNode.right!);
            currentLevelResult.add(currentNode.right!.val);
          }
          print(counter);
          counter--;
        }
      } else {
        while (counter < dqSize) {
          final currentNode = dQ.removeFirst();

          if (currentNode.right != null) {
            dQ.add(currentNode.right!);
            currentLevelResult.add(currentNode.right!.val);
          }
          if (currentNode.left != null) {
            dQ.add(currentNode.left!);
            currentLevelResult.add(currentNode.left!.val);
          }
          counter++;
        }
      }
      if (currentLevelResult.isNotEmpty) {
        _zigzagResult.add(currentLevelResult);
        isLTR = !isLTR;
      }
    }
    return _zigzagResult;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}
