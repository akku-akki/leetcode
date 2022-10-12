void main() {
  ListNode? list =
      ListNode(-10, ListNode(-3, ListNode(0, ListNode(5, ListNode(9)))));
  TreeNode? treeNode = Solution().sortedListToBST(list);
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  TreeNode? sortedListToBST(ListNode? head) {
    if (head == null) return null;
    ListNode? mid = getMid(head);
    TreeNode root = TreeNode(mid!.val);
    if (head == mid) return root;
    root.left = sortedListToBST(head);
    root.right = sortedListToBST(mid.next);
    return root;
  }

  ListNode? getMid(ListNode? head) {
    ListNode? fast = head;
    ListNode? slow = head;
    ListNode? prev = head;
    while (fast != null && fast.next != null) {
      prev = slow;
      slow = slow?.next;
      fast = fast.next?.next;
    }
    if (prev != null) {
      prev.next = null;
    }
    return slow;
  }
}
