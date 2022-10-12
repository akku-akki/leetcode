void main() {
  void getInOrderTraversal(TreeNode? root, List<int> result) {
    if (root == null) {
      print('null');
      return;
    }

    getInOrderTraversal(root.left, result);

    getInOrderTraversal(root.right, result);
            print(root.val);

  }

  TreeNode? node = Solution().sortedArrayToBST([-10, -3, 0, 5, 9]);
  getInOrderTraversal(node, []);
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    return _getArrayToBST(
      0,
      nums.length - 1,
      nums,
    );
  }

  TreeNode? _getArrayToBST(
    int start,
    int end,
    List<int> nums,
  ) {
    if (start > end) return null;
    int mid = (start + end) ~/ 2;
    TreeNode currentNode = TreeNode(nums[mid]);
    currentNode.left = _getArrayToBST(
      start,
      mid - 1,
      nums,
    );
    currentNode.right = _getArrayToBST(
      mid + 1,
      end,
      nums,
    );
    return currentNode;
  }
}
