void main() {
  ListNode list =
      ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  reorderList(list);
  ListNode? node = list;
  while (node != null) {
    print(node.val);
    node = node.next;
  }
}

void reorderList(ListNode? head) {
  if (head == null || head.next == null) return;
  ListNode? first = head;
  ListNode? slow = head;
  ListNode? fast = head;
  ListNode? prev = null;

  while (fast != null && fast.next != null) {
    prev = slow;
    slow = slow!.next;
    fast = fast.next?.next;
  }
  prev?.next = null;

  ListNode? l2 = reverseList(slow);
  merge(first, l2);
}

ListNode? reverseList(ListNode? head) {
  ListNode? prev = null;
  ListNode? current = head;

  while (current != null) {
    ListNode? next = current.next;
    current.next = prev;
    prev = current;
    current = next;
  }
  return prev;
}

void merge(ListNode? l1, ListNode? l2) {
  while (l1 != null) {
    ListNode? nextL1 = l1.next;
    ListNode? nextL2 = l2?.next;
    l1.next = l2;
    if (nextL1 == null) {
      break;
    }
    l2?.next = nextL1;
    l1 = nextL1;
    l2 = nextL2;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}
