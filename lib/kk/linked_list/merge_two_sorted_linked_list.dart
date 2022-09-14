void main() {
  ListNode list1 = ListNode(1, ListNode(2, ListNode(4)));
  ListNode list2 = ListNode(1, ListNode(3, ListNode(4)));

  print(mergeTwoLists(list1, list2));
}

ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
  ListNode dummyHead = ListNode();
  ListNode tail = dummyHead;
  while (list1 != null && list2 != null) {
    if (list1.val < list2.val) {
      tail.next = list1;
      list1 = list1.next;
      tail = tail.next!;
    } else {
      tail.next = list2;
      list2 = list2.next;
      tail = tail.next!;
    }
  }
  tail.next = (list1 != null) ? list1 : list2;
  return dummyHead.next;
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
