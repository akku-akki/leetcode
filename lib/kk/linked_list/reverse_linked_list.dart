void main() {
  ListNode list =
      ListNode(5, ListNode(4, ListNode(3, ListNode(2, ListNode(1)))));
  ListNode? node =
      // list;
      reverseList(list);

  while (node != null) {
    print(node.val);
    print('Next =>');
    node = node.next;
  }
  print('\n\n');
}

ListNode? reverseList(ListNode? head) {
  
  ListNode? prev = null;
  ListNode? present = head;
  ListNode? next = present?.next;

  while (present != null) {
    present.next = prev;
    prev = present;
    present = next;
    if (next != null) {
      next = next.next;
    }
  }

  return prev;
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
