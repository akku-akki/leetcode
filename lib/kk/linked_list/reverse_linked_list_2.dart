void main() {
  ListNode list =
      ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  ListNode? node =
      // list;
      reverseBetween(list, 2, 4);

  while (node != null) {
    print(node.val);
    print('Next =>');
    node = node.next;
  }
  print('\n\n');
}

ListNode? reverseBetween(ListNode? head, int left, int right) {
  if (left == right) {
    return head;
  }

  ListNode? current = head;
  ListNode? prev = null;

  for (int i = 0; current != null && i < left - 1; i++) {
    prev = current;
    current = current.next;
  }
  ListNode? last = prev;
  ListNode? newEnd = current;
  ListNode? next = current?.next;

  for (int i = 0; current != null && i < right - left + 1; i++) {
    current.next = prev;
    prev = current;
    current = next;
    next = next?.next;
  }

  if (last != null) {
    last.next = prev;
  } else {
    head = prev;
  }

  newEnd?.next = current;
  return head;
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
