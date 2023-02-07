void main() {
  print(Solution().addBinary('11', '1'));
}

class Solution {
  String addBinary(String a, String b) {
    int firstNo = int.parse(a);
    int second = int.parse(b);

    int ans = 11 & 1;
    print(ans);
    return '';
  }
}
