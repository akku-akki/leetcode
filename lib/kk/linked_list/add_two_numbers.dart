void main() {
  final result = Solution().addTwoNumbers(
    ListNode(
      2,
      ListNode(
        4,
        ListNode(3),
      ),
    ),
    ListNode(
      5,
      ListNode(
        6,
        ListNode(4),
      ),
    ),
  );

  ListNode? current = result!;

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
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode? resultList = ListNode(0);
    ListNode? p = l1, q = l2, current = resultList;
    int carry = 0;
    while (p != null || q != null) {
      int a = p == null ? 0 : p.val;
      int b = q == null ? 0 : q.val;
      int sum = a + b + carry;
      int unitsPlace = sum % 10;
      carry = sum ~/ 10;
      current!.next = ListNode(unitsPlace);
      current = current.next;
      if (p != null) p = p.next;
      if (q != null) q = q.next;
    }
    if (carry > 0) {
      current!.next = ListNode(carry);
    }
    return resultList.next;
  }
}
