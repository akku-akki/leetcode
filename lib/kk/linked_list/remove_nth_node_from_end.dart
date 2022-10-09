void main() {
  final node = Solution().removeNthFromEnd(
    ListNode(
      1,
    ),
    1,
  );

  ListNode? current = node;

  while (current != null) {
    print(current.val);
    current = current.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    ListNode? dummy = ListNode(0);
    dummy.next = head;
    ListNode? start = head;
    ListNode? end = head;
    for (int i = 0; i <= n; i++) {
      end = end?.next;
    }
    while (end != null) {
      end = end.next;
      start = start!.next;
    }
    start?.next = start.next?.next;
    return head;
  }
}
