import '../../test/debug_utils.dart/u.dart';

void main() {
  print(Solution().findKthPositive([2, 3, 4, 7, 11], 5));
}

class Solution {
  int findKthPositive(List<int> arr, int k) {
    int missing = -1;
    int index = 0;
    int kPosition = 0;
    int integer = 1;

    while (kPosition <= k) {
      if (index >= arr.length) {
        missing = integer;
        integer++;
        kPosition++;
        if (k == kPosition) {
          return missing;
        }
        continue;
      }
      if (arr[index] == integer) {
        index++;
        integer++;
      } else {
        missing = integer;
        integer++;
        kPosition++;
      }
      if (k == kPosition) {
        return missing;
      }
    }

    return missing;
  }
}
