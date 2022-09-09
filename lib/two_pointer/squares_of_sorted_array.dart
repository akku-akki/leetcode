void main() {
  print(sortedSquares([-4, -1, 0, 3, 10]));
}

List<int> sortedSquares(List<int> nums) {
  int startPointer = 0;
  int endPointer = nums.length - 1;
  int minNegative = -99999999999999;
  List<int> squaredResult =
      List.generate(nums.length, (index) => minNegative, growable: false);
  int highestSquareIndex = endPointer;
  while (startPointer <= endPointer) {
    int leftSquare = nums[startPointer] * nums[startPointer];
    int rightSquare = nums[endPointer] * nums[endPointer];
    print(squaredResult);
    if (leftSquare > rightSquare) {
      squaredResult[highestSquareIndex] = leftSquare;
      highestSquareIndex--;
      startPointer++;
    } else {
      squaredResult[highestSquareIndex] = rightSquare;
      highestSquareIndex--;
      endPointer--;
    }
  }
  return squaredResult;
}
