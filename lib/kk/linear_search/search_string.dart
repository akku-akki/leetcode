void main() {
  String word = 'Hello world';
  String target = 'O';
  print(searchChar(word, target));
}

bool searchChar(String word, String targetChar) {
  if (word.length == 0) return false;

  for (int i = 0; i < word.length; i++) {
    if (word[i] == targetChar) {
      return true;
    }
  }

  return false;
}
