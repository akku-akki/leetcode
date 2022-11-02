void main() {
  permutations("", "abc");
}

void permutations(String p, String up) {
  if (up.isEmpty) {
    print(p);
    return;
  }
  String ch = up[0];
  for (int i = 0; i <= p.length; i++) {
    String f = p.substring(0, i);
    String s = p.substring(i, p.length);
    String currentProcessed = f + ch + s;
    // print('CP => $currentProcessed [ $f + $s + $ch ]');
    permutations(currentProcessed, up.substring(1));
  }
}
