// leetcode 208

void main() {
  Trie trie = new Trie();
  trie.insert("apple");
  trie.search("apple"); // return True
  trie.search("app"); // return False
  trie.startsWith("app"); // return True
  trie.insert("app");
  trie.search("app"); // return True
}

class Trie {
  Node root;
  Trie() : root = Node('');

  void insert(String word) {
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
    if (current.children.containsKey(word[currentLength])) {
      return _isPresent(
          currentLength + 1, current.children[word[currentLength]]!, word);
    }
    return false;
  }

  bool startsWith(String prefix) {
    if (prefix == '') return false;

    return _startWith(0, root, prefix);
  }

  bool _startWith(
    int currentLength,
    Node current,
    String word,
  ) {
    if (currentLength == word.length) {
      return true;
    }
    if (current.children.containsKey(word[currentLength])) {
      return _startWith(
          currentLength + 1, current.children[word[currentLength]]!, word);
    }
    return false;
  }
}

class Node {
  String word;
  Map<String, Node> children = {};
  bool isEnd = false;
  Node(this.word);
}
