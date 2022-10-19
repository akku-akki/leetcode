import 'dart:math';

void main() {
  print(Solution().smallestRange([
    [4, 10, 15, 24, 26],
    [0, 9, 12, 20],
    [5, 18, 22, 30]
  ]));
}

// The key insight/ intuition (non-obvious) is that the heap always contains ONLY 1 element from each list/ row array. The heap NEVER contains 2 or more elements from the SAME list.
// This is important because it means that the range calculated at every iteration is always guaranteed to be a range that has exactly 1 element from every single list!

class Solution {
  List<int> smallestRange(List<List<int>> nums) {
    int currentMax = -999999999999999;
    int startRange = 0;
    int endRange = 999999999999999;

    HeapPriorityQueue<NumberIndex> pQ =
        HeapPriorityQueue((p0, p1) => nums[p0.arrayIndex][p0.elementIndex] - nums[p1.arrayIndex][p1.elementIndex]);
    for (int i = 0; i < nums.length; i++) {
      pQ.add(NumberIndex(i, 0));
      currentMax = max(currentMax, nums[i][0]);

      while (pQ.length == nums.length) {
        final current = pQ.removeFirst();
        if (endRange - startRange >
            currentMax - nums[current.arrayIndex][current.elementIndex]) {
          startRange = nums[current.arrayIndex][current.elementIndex];
          endRange = currentMax;
        }
        current.elementIndex++;
        if (nums[current.arrayIndex].length > current.elementIndex) {
          pQ.add(current);
          currentMax =
              max(currentMax, nums[current.arrayIndex][current.elementIndex]);
        }
      }
    }
    return [startRange, endRange];
  }
}

class NumberIndex {
  int arrayIndex;
  int elementIndex;

  NumberIndex(
    this.arrayIndex,
    this.elementIndex,
  );
}

class HeapPriorityQueue<E> {
  static const int _initialCapacity = 7;
  final Comparator<E> comparison;
  List<E?> _queue = List<E?>.filled(_initialCapacity, null);
  int _length = 0;
  HeapPriorityQueue(int Function(E, E) comparison) : comparison = comparison;

  E _elementAt(int index) => _queue[index] ?? (null as E);

  void add(E element) {
    _add(element);
  }

  void addAll(Iterable<E> elements) {
    for (var element in elements) {
      _add(element);
    }
  }

  void clear() {
    _queue = const [];
    _length = 0;
  }

  bool contains(E object) => _locate(object) >= 0;

  E get first {
    if (_length == 0) throw StateError('No element');
    return _elementAt(0);
  }

  bool get isEmpty => _length == 0;

  bool get isNotEmpty => _length != 0;

  int get length => _length;

  bool remove(E element) {
    var index = _locate(element);
    if (index < 0) return false;
    var last = _removeLast();
    if (index < _length) {
      var comp = comparison(last, element);
      if (comp <= 0) {
        _bubbleUp(last, index);
      } else {
        _bubbleDown(last, index);
      }
    }
    return true;
  }

  Iterable<E> removeAll() {
    var result = _queue;
    var length = _length;
    _queue = const [];
    _length = 0;
    return result.take(length).cast();
  }

  E removeFirst() {
    if (_length == 0) throw StateError('No element');
    var result = _elementAt(0);
    var last = _removeLast();
    if (_length > 0) {
      _bubbleDown(last, 0);
    }
    return result;
  }

  @override
  String toString() {
    return _queue.take(_length).toString();
  }

  void _add(E element) {
    if (_length == _queue.length) _grow();
    _bubbleUp(element, _length++);
  }

  int _locate(E object) {
    if (_length == 0) return -1;
    var position = 1;
    do {
      var index = position - 1;
      var element = _elementAt(index);
      var comp = comparison(element, object);
      if (comp <= 0) {
        if (comp == 0 && element == object) return index;
        var leftChildPosition = position * 2;
        if (leftChildPosition <= _length) {
          position = leftChildPosition;
          continue;
        }
      }
      do {
        while (position.isOdd) {
          position >>= 1;
        }
        position += 1;
      } while (position > _length);
    } while (position != 1);
    return -1;
  }

  E _removeLast() {
    var newLength = _length - 1;
    var last = _elementAt(newLength);
    _queue[newLength] = null;
    _length = newLength;
    return last;
  }

  void _bubbleUp(E element, int index) {
    while (index > 0) {
      var parentIndex = (index - 1) ~/ 2;
      var parent = _elementAt(parentIndex);
      if (comparison(element, parent) > 0) break;
      _queue[index] = parent;
      index = parentIndex;
    }
    _queue[index] = element;
  }

  void _bubbleDown(E element, int index) {
    var rightChildIndex = index * 2 + 2;
    while (rightChildIndex < _length) {
      var leftChildIndex = rightChildIndex - 1;
      var leftChild = _elementAt(leftChildIndex);
      var rightChild = _elementAt(rightChildIndex);
      var comp = comparison(leftChild, rightChild);
      int minChildIndex;
      E minChild;
      if (comp < 0) {
        minChild = leftChild;
        minChildIndex = leftChildIndex;
      } else {
        minChild = rightChild;
        minChildIndex = rightChildIndex;
      }
      comp = comparison(element, minChild);
      if (comp <= 0) {
        _queue[index] = element;
        return;
      }
      _queue[index] = minChild;
      index = minChildIndex;
      rightChildIndex = index * 2 + 2;
    }
    var leftChildIndex = rightChildIndex - 1;
    if (leftChildIndex < _length) {
      var child = _elementAt(leftChildIndex);
      var comp = comparison(element, child);
      if (comp > 0) {
        _queue[index] = child;
        index = leftChildIndex;
      }
    }
    _queue[index] = element;
  }

  void _grow() {
    var newCapacity = _queue.length * 2 + 1;
    if (newCapacity < _initialCapacity) newCapacity = _initialCapacity;
    var newQueue = List<E?>.filled(newCapacity, null);
    newQueue.setRange(0, _length, _queue);
    _queue = newQueue;
  }
}
