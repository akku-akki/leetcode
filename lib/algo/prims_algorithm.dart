// Using heaps = TC = (E logV)

void main() {
  int noOfVertices = 5;
  int startVertex = 0;

  List<List<Map<int, int>>> adj2 = List.generate(noOfVertices, (index) => []);

  /**  GRAPH
   *        w= 4
   *   n=0 ------- n=1 \  
   *   |        /         \w=4
   *   |w=1   / w=2             ----- n= 4 
   *   |    /             /w=4
   *   n=2-------- n=3 /
   *       w=4
   */

  //

  adj2[0] = [
    {1: 4},
    {2: 1}
  ];
  adj2[1] = [
    {0: 4},
    {2: 2},
    {4: 4}
  ];
  adj2[2] = [
    {0: 1},
    {1: 2},
    {3: 4}
  ];
  adj2[3] = [
    {2: 4},
    {4: 4},
  ];
  adj2[4] = [
    {1: 4},
    {3: 4}
  ];

  List<int> path = List.generate(noOfVertices, (index) => -1);
  Map<int, int> distance = {};
  List<bool> mstset = List.generate(
    noOfVertices,
    (index) => false,
  );

  for (int i = 0; i < noOfVertices; i++) {
    distance[i] = 999999999999999999;
  }
  distance[startVertex] = 0; // make start distance  = 0;
  path[startVertex] = startVertex; // updating path for start vertex to itself

  HeapPriorityQueue<Map<int, int>> pQ =
      HeapPriorityQueue((p0, p1) => p0.values.first - p1.values.first);
  pQ.add({startVertex: distance[startVertex]!});

  while (pQ.isNotEmpty) {
    Map<int, int> vertexPair = pQ.removeFirst();
    int vertex = vertexPair.keys.first;
    mstset[vertex] = true;
    List<Map<int, int>> adjVertices = adj2[vertex];
    for (final adjPair in adjVertices) {
      int adjVertex = adjPair.keys.first;
      int weight = adjPair.values.first;
      int newDistance = distance[vertex]! + weight;
      if (!mstset[adjVertex] && distance[adjVertex]! > newDistance) {
        pQ.remove(adjPair);
        distance[adjVertex] = newDistance;
        final updateDistance = {adjVertex: newDistance};
        path[adjVertex] = vertex;
        pQ.add(updateDistance);
      }
    }
  }
  for (int i = 0; i < noOfVertices; i++) {
    if (i != startVertex) {
      print(' PATH FOR NODE $i  =  PATH => ${path[i]}');
    }
  }
  // ANS => 1->2, 2->0, 3->2, 4->1
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
