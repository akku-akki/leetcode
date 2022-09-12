void main() {
  print(nextGreatestLetter(["c", "f", "j"], 'c'));
}

String nextGreatestLetter(List<String> letters, String target) {
  int start = 0;
  int end = letters.length - 1;
  while (start <= end) {
    int mid = (start + end) ~/ 2;
    if (target.compareTo(letters[mid]) == -1) {
      end = mid - 1;
    }else{
      start = mid + 1;
    }
  }
  return letters[start % letters.length];
}
