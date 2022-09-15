void main() {
  ListNode list =
      ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
}

void reorderList(ListNode? head) {
  if (head == null || head.next == null) {
    return;
  }
  ListNode? mid = getMid(head);
  ListNode? hs = reverseList(mid);
  ListNode? hf = head;

  while (hf != null && hs != null) {
    ListNode? temp = hf.next;
    hf.next = hs;
    hf = temp;
    temp = hs.next;
    hs.next = hf;
    hs = temp;
  }
  if (hf != null) {
    hf.next = null;
  }
}

ListNode? getMid(ListNode? head) {
  ListNode? midPrev = null;
  while (head != null && head.next != null) {
    midPrev = (midPrev == null) ? head : midPrev.next;
    head = head.next?.next;
  }
  ListNode? mid = midPrev?.next;
  midPrev?.next = null;
  return mid;
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
