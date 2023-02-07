import 'dart:collection';

void main() {
  MyQueue myQueue = new MyQueue();
  myQueue.push(1); // queue is: [1]
  print(myQueue.toString());
  myQueue.push(2); // queue is: [1, 2] (leftmost is front of the queue)
  print(myQueue.toString());

  print(myQueue.peek()); // return 1
  print(myQueue.pop()); // return 1, queue is [2]
  print(myQueue.toString());

  print(myQueue.empty()); // return false
}

class MyQueue {
  MyQueue() {
    input = Stack();
    output = Stack();
  }

  late Stack input, output;

  void push(int x) {
    input.add(x);
  }

  int pop() {
    int val = output.peek();
    output.remove();
    return val;
  }

  int peek() {
    if (output.isEmpty()) {
      while (input.isEmpty() == false) {
        output.add(input.remove());
      }
    }
    return output.peek();
  }

  bool empty() => input.isEmpty() && output.isEmpty();
}

class Stack<int> {
  DoubleLinkedQueue<int> _stack = DoubleLinkedQueue<int>();

  void add(int value) {
    _stack.addFirst(value);
  }

  int remove() {
    return _stack.removeFirst();
  }

  int peek() {
    return _stack.first;
  }

  bool isEmpty() => _stack.isEmpty;
}
