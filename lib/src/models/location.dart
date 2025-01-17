import 'package:word_search/word_search.dart';

/// Word location interface
class WSLocation implements WSPosition {
  WSLocation({
    required this.x,
    required this.y,
    this.orientation,
    required this.overlap,
    required this.word,
  });

  /// The column position where the word starts
  @override
  final int x;

  /// The row position where the word starts
  @override
  final int y;

  /// The orientation the word placed in the puzzle
  final WSOrientation? orientation;

  /// The numbed of overlaps the word has
  final int overlap;

  /// The word used
  String word;
}
