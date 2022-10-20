void main() {
  print(
    Solution().floodFill(
      [
        [1, 1, 1],
        [1, 1, 0],
        [1, 0, 1]
      ],
      1,
      1,
      2,
    ),
  );
}

class Solution {
  List<List<int>> floodFill(
    List<List<int>> image,
    int sr,
    int sc,
    int color,
  ) {
    int m = image.length;
    int n = image[0].length;
    int oldColor = image[sr][sc];
    if (oldColor == color) return image;
    _floodFill(sr, sc, m, n, oldColor, color, image);
    return image;
  }

  void _floodFill(
    int i,
    int j,
    int m,
    int n,
    int oldColor,
    int newColor,
    List<List<int>> image,
  ) {
    image[i][j] = newColor;
    if (isValid(i + 1, j, m, n, oldColor, image))
      _floodFill(i + 1, j, m, n, oldColor, newColor, image);
    if (isValid(i - 1, j, m, n, oldColor, image))
      _floodFill(i - 1, j, m, n, oldColor, newColor, image);
    if (isValid(i, j + 1, m, n, oldColor, image))
      _floodFill(i, j + 1, m, n, oldColor, newColor, image);
    if (isValid(i, j - 1, m, n, oldColor, image))
      _floodFill(i, j - 1, m, n, oldColor, newColor, image);
  }

  bool isValid(
    int i,
    int j,
    int m,
    int n,
    int oldColor,
    List<List<int>> image,
  ) {
    if (i >= 0 && i < m && j >= 0 && j < n && image[i][j] == oldColor) {
      return true;
    }
    return false;
  }
}
