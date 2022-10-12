void main() {
  ListNode? node = Solution().oddEvenList(
    ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))),
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
  ListNode? oddEvenList(ListNode? head) {
    if (head == null) return null;
    ListNode? odd = head;
    ListNode? even = head.next;

    ListNode? oddHead = odd;
    ListNode? evenHead = even;

    while (even != null && even.next != null) {
      odd?.next = odd.next?.next;
      even.next = even.next?.next;
      odd = odd?.next;
      even = even.next;
    }
    odd?.next = evenHead;
    return head;
  }
}
