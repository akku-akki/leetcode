void main() {
  Heap heap = Heap();
  heap.insert(8);
  heap.insert(7);
  heap.insert(6);
  heap.insert(5);
  heap.insert(4);
  heap.insert(3);
  heap.insert(2);
  heap.insert(1);
  print(heap);
  print(heap.size);
  print('Removing Start');
  print(heap.remove());
  print('Removing End');
  print(heap);
  print(heap.size);
}

class Heap {
  List item = List.generate(10, (index) => null);
  int size = 0;

  void insert(int value) {
    if (_isFull()) throw 'THIS IS FULL';
    item[size] = value;
    size++;
    _bubbleUp();
  }

  void _bubbleUp() {
    int index = size - 1;
    while (index > 0 && item[index] > item[_parent(index)]) {
      _swap(index, _parent(index));
      index = _parent(index);
    }
  }

  bool _isFull() => size == item.length;

  int _parent(int index) => (index - 1) ~/ 2;
  void _swap(int index1, int index2) {
    final temp = item[index1];
    item[index1] = item[index2];
    item[index2] = temp;
  }

  int remove() {
    if (isEmpty()) throw 'Empty State';
    int root = item[0];
    item[0] = item[size - 1];
    size--;
    _bubbleDown();
    return root;
  }

  void _bubbleDown() {
    int index = 0;
    while (index <= size && !_isValidParent(index)) {
      int largerChildIndex = _largerChildIndex(index);
      _swap(index, largerChildIndex);
      index = largerChildIndex;
    }
  }

  bool isEmpty() => size == 0;

  bool _isValidParent(int index) {
    if (!_hasLeftChild(index)) return true;
    bool isValid = item[index] >= _leftChild(index);
    if (_hasRightChild(index)) {
      isValid = isValid && item[index] >= _rightChild(index);
    }
    return isValid;
  }

  int _largerChildIndex(int index) {
    if (!_hasLeftChild(index)) return index;
    if (!_hasRightChild(index)) return _leftChildIndex(index);
    return (_leftChild(index) > _rightChild(index))
        ? _leftChildIndex(index)
        : _rightChildIndex(index);
  }

  int _leftChildIndex(int index) => index * 2 + 1;
  int _rightChildIndex(int index) => index * 2 + 2;
  int _leftChild(index) => item[_leftChildIndex(index)];
  int _rightChild(index) => item[_rightChildIndex(index)];
  bool _hasLeftChild(int index) => _leftChildIndex(index) < size;
  bool _hasRightChild(int index) => _rightChildIndex(index) < size;

  @override
  String toString() {
    return item.toString();
  }
}
