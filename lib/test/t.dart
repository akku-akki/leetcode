import 'dart:collection';

import 'debug_utils.dart/u.dart';

void main() {
  cPrint(output: 'Ankit', c: C.red);
  cPrint(output: 'Ankit', c: C.green);
  cPrint(output: 'Ankit', c: C.yellow);
  cPrint(output: 'Ankit', c: C.blue);
  cPrint(output: 'Ankit', c: C.purple);
  cPrint(output: 'Ankit', c: C.cyan);
  cPrint(output: 'Ankit');

  cPrintBg(output: 'Ankit', c: C.red);
  cPrintBg(output: 'Ankit', c: C.green);
  cPrintBg(output: 'Ankit', c: C.yellow);
  cPrintBg(output: 'Ankit', c: C.blue);
  cPrintBg(output: 'Ankit', c: C.purple);
  cPrintBg(output: 'Ankit', c: C.cyan);
  cPrintBg(output: 'Ankit');
  cPrintReset();
  DoubleLinkedQueue<int> dQ = DoubleLinkedQueue();
  dQ.addFirst(1);
  dQ.addFirst(2);
  dQ.addFirst(3);
  dQ.addFirst(4);

  while (dQ.isNotEmpty) {
    print(dQ.removeFirst());
  }
}
