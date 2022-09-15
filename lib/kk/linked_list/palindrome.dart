void main() {}

bool isPalindrome(ListNode? head) {
  ListNode? mid = getMid(head);
  ListNode? headSecond = reverseList(mid);
  ListNode? reReverseHead = headSecond;

  while (head != null && headSecond != null) {
    if (head.val != headSecond.val) {
      break;
    }
    head = head.next;
    headSecond = headSecond.next;
  }
  reverseList(reReverseHead);
  return head == null || headSecond == null;
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
