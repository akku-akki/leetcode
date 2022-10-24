void main() {
  WordDictionary wordDictionary = new WordDictionary();
  wordDictionary.addWord("bad");
  wordDictionary.addWord("dad");
  wordDictionary.addWord("mad");
  print(wordDictionary.search("pad")); // return False
  print(wordDictionary.search("bad")); // return True
  print(wordDictionary.search(".ad")); // return True
  print(wordDictionary.search("b..")); // return True
  print(wordDictionary.search('.a.'));
}

class WordDictionary {
  Node root;
  WordDictionary() : root = Node('');

  void addWord(String word) {
    Node current = root;
    for (int i = 0; i < word.length; i++) {
      if (!current.children.containsKey(word[i])) {
        current.children[word[i]] = Node(word[i]);
      }
      current = current.children[word[i]]!;
    }
    current.isEnd = true;
  }

  bool search(String word) {
    if (word == '') return false;
    return _isPresent(0, root, word);
  }

  bool _isPresent(
    int currentLength,
    Node current,
    String word,
  ) {
    if (currentLength == word.length) {
      return current.isEnd;
    }
    final currentWord = word[currentLength];
    if (currentWord == '.') {
      for (final node in current.children.values) {
        if (_isPresent(currentLength + 1, node, word)) {
          return true;
        }
      }
      
      return false;
    } else if (current.children.containsKey(word[currentLength])) {
      return _isPresent(
        currentLength + 1,
        current.children[word[currentLength]]!,
        word,
      );
    } else {
      return false;
    }
  }
}

class Node {
  String word;
  Map<String, Node> children = {};
  bool isEnd = false;
  Node(this.word);
}
