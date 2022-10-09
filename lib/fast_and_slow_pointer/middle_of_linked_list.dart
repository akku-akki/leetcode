void main() {
  ListNode? node = Solution().middleNode(
    ListNode(
      1,
      ListNode(
        2,
        ListNode(
          3,
          ListNode(
            4,
            ListNode(
              5,
              ListNode(
                6,
              ),
            ),
          ),
        ),
      ),
    ),
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
  ListNode? middleNode(ListNode? head) {
    ListNode? slow = head;
    ListNode? fast = head;
    while (fast != null && fast.next != null) {
      fast = fast.next?.next;
      slow = slow!.next;
    }
    return slow;
  }
}
