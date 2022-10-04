
//⚠️⚠️⚠️ todo pending
void main() {
  List<int> data = [2, 0, 2, 1, 1, 0];
  countingSort(data, 2);
  print(data);
}

// WHEN TO USE
// 1. Allocating extra space is not an issue.
// 2. values are positive
// 3. most of the values in range are present   (range ( 5 to 30))
///
void countingSort(List<int> nums, int max) {
  final List<int> count = List.generate(max + 1, (index) => 0);
  for (int i = 0; i < nums.length; i++) {
    count[i] = nums[i];
  }
  print(count);
}
