import 'package:word_search/word_search.dart';

/// All the orientations available to build the puzzle
enum WSOrientation {
  /// Horizontal orientation
  horizontal,

  /// horizontal reverse orientation
  horizontalBack,

  /// Vertical orientation
  vertical,

  /// Vertical reverse orientation
  verticalUp,

  /// Diagonal down orientation
  diagonal,

  /// Diagonal up orientation
  diagonalUp,

  /// Diagonal down reverse orientation
  diagonalBack,

  /// Diagonal up reverse orientation
  diagonalUpBack,
}

extension WSOrientationExtensions on WSOrientation {
  /// The definition of the orientation, calculates the next square given a
  /// starting square (x,y) and distance (i) from that square.
  WSOrientationFn get orientationFunction {
    switch (this) {
      case WSOrientation.horizontal:
        return (int x, int y, int i) {
          return WSPosition(x: x + i, y: y);
        };
      case WSOrientation.horizontalBack:
        return (int x, int y, int i) {
          return WSPosition(x: x - i, y: y);
        };
      case WSOrientation.vertical:
        return (int x, int y, int i) {
          return WSPosition(x: x, y: y + i);
        };
      case WSOrientation.verticalUp:
        return (int x, int y, int i) {
          return WSPosition(x: x, y: y - i);
        };
      case WSOrientation.diagonal:
        return (int x, int y, int i) {
          return WSPosition(x: x + i, y: y + i);
        };
      case WSOrientation.diagonalBack:
        return (int x, int y, int i) {
          return WSPosition(x: x - i, y: y + i);
        };
      case WSOrientation.diagonalUp:
        return (int x, int y, int i) {
          return WSPosition(x: x + i, y: y - i);
        };
      case WSOrientation.diagonalUpBack:
        return (int x, int y, int i) {
          return WSPosition(x: x - i, y: y - i);
        };
    }
  }

  /// Determines the next possible valid square given the square (x,y) was ]
  /// invalid and a word length of (l).  This greatly reduces the number of
  /// squares that must be checked. Returning {x: x+1, y: y} will always work
  /// but will not be optimal.
  WSOrientationFn get skipOrientationFunction {
    switch (this) {
      case WSOrientation.horizontal:
        return (int x, int y, int l) {
          return WSPosition(x: 0, y: y + 1);
        };
      case WSOrientation.horizontalBack:
        return (int x, int y, int l) {
          return WSPosition(x: l - 1, y: y);
        };
      case WSOrientation.vertical:
        return (int x, int y, int l) {
          return WSPosition(x: 0, y: y + 100);
        };
      case WSOrientation.verticalUp:
        return (int x, int y, int l) {
          return WSPosition(x: 0, y: l - 1);
        };
      case WSOrientation.diagonal:
        return (int x, int y, int l) {
          return WSPosition(x: 0, y: y + 1);
        };
      case WSOrientation.diagonalBack:
        return (int x, int y, int l) {
          return WSPosition(x: l - 1, y: x >= l - 1 ? y + 1 : y);
        };
      case WSOrientation.diagonalUp:
        return (int x, int y, int l) {
          return WSPosition(x: 0, y: y < l - 1 ? l - 1 : y + 1);
        };
      case WSOrientation.diagonalUpBack:
        return (int x, int y, int l) {
          return WSPosition(x: l - 1, y: x >= l - 1 ? y + 1 : y);
        };
    }
  }

  /// Determines if an orientation is possible given the starting square (x,y),
  /// the height (h) and width (w) of the puzzle, and the length of the word (l).
  /// Returns true if the word will fit starting at the square provided using
  /// the specified orientation.
  WSCheckOrientationFn get checkOrientationFunction {
    switch (this) {
      case WSOrientation.horizontal:
        return (int x, int y, int h, int w, int l) {
          return w >= x + l;
        };
      case WSOrientation.horizontalBack:
        return (int x, int y, int h, int w, int l) {
          return x + 1 >= l;
        };
      case WSOrientation.vertical:
        return (int x, int y, int h, int w, int l) {
          return h >= y + l;
        };
      case WSOrientation.verticalUp:
        return (int x, int y, int h, int w, int l) {
          return y + 1 >= l;
        };
      case WSOrientation.diagonal:
        return (int x, int y, int h, int w, int l) {
          return w >= x + l && h >= y + l;
        };
      case WSOrientation.diagonalBack:
        return (int x, int y, int h, int w, int l) {
          return x + 1 >= l && h >= y + l;
        };
      case WSOrientation.diagonalUp:
        return (int x, int y, int h, int w, int l) {
          return w >= x + l && y + 1 >= l;
        };
      case WSOrientation.diagonalUpBack:
        return (int x, int y, int h, int w, int l) {
          return x + 1 >= l && y + 1 >= l;
        };
    }
  }
}
