void main() {
  print(isHappy(19));
}

bool isHappy(int n) {
  if (n == 1) return true;
  Map<int, int> record = {};
  int currentNumber = n;
  while (currentNumber != 1) {
    print(record);
    if (record.containsKey(currentNumber)) {
      return false;
    }
    final data = currentNumber.toString().split('');
    int value = 0;
    data.forEach((element) {
      final number = int.parse(element);
      value = value + (number * number);
    });

    if (value == 1) {
      return true;
    }
    record[currentNumber] = value;
    currentNumber = value;
  }
  return false;
}
