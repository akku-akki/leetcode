void main() {
  print(findErrorNums([2, 2]));
}

List<int> findErrorNums(List<int> nums) {
  int n = nums.length;
  int dup = -1, miss = -1;

  for (int i = 1; i <= n; ++i) {
    int count = 0;
    for (int num in nums) {
      if (num == i) {
        count += 1;
      }
    }
    if (count == 2) dup = i;
    if (count == 0) miss = i;
    if (dup > 0 && miss > 0) break;
  }
  return [dup, miss];
}
