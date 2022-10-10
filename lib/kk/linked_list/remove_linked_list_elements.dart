// LEETCODE 203
void main() {
  ListNode? node = Solution().removeElements(
    ListNode(
      7,
    ),
    7,
  );

  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeElements(ListNode? head, int val) {
    ListNode dummy = ListNode(0);
    dummy.next = head;
    ListNode? current = dummy;
    ListNode? previous = dummy;

    while (current != null) {
      if (current.val == val) {
        previous?.next = current.next;
        current = previous?.next;
        continue;
      }
      previous = current;
      current = current.next;
    }
    return dummy.next;
  }
}
