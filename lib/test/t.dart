import 'dart:collection';

void main() {
  DoubleLinkedQueue<int> dQ = DoubleLinkedQueue();
  dQ.addFirst(1);
  dQ.addFirst(2);
  dQ.addFirst(3);
  dQ.addFirst(4);

  while (dQ.isNotEmpty) {
    print(dQ.removeFirst());
  }
}
