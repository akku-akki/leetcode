void main() {
  print(twoSum([3, 2, 4], 6));
}

List<int> twoSum(List<int> nums, int target) {
  Map<int, int> record = {};

  for (int i = 0; i < nums.length; i++) {
    final another = target - nums[i];

    if (record.containsKey(another)) {
      print(record);
      return [record[another]!, i];
    }

    record[nums[i]] = i;
  }
  print(record);
  return [];
}
