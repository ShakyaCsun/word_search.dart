import 'package:word_search/word_search.dart';

/// New puzzle interface
class WSNewPuzzle {
  WSNewPuzzle({
    this.puzzle,
    List<String>? wordsNotPlaced,
    List<String>? warnings,
    List<String>? errors,
  })  : wordsNotPlaced = wordsNotPlaced ?? [],
        warnings = warnings ?? [],
        errors = errors ?? [];

  /// Two dimentional list containing the puzzle
  List<List<String>>? puzzle;

  /// List of word not placed in the puzzle
  List<String> wordsNotPlaced;

  /// List of warnings that occured while creating the puzzle
  ///
  /// **Note:** Use this to notify the user of any issues
  List<String> warnings;

  /// List of errors that occured while creating the puzzle
  ///
  /// **Note:** Check this before printing or viewing the puzzle
  List<String> errors;

  /// Outputs a puzzle to the console, useful for debugging.
  /// Returns a formatted string representing the puzzle.
  ///
  /// Example:
  /// ```
  /// final List<String> wl = ['hello', 'world', 'foo', 'bar', 'baz', 'dart'];
  /// final WSSettings ws = WSSettings();
  /// final WordSearch wordSearch = WordSearch();
  /// final WSNewPuzzle newPuzzle = wordSearch.newPuzzle(wl, ws);
  /// // Outputs the 2D puzzle
  /// print(newPuzzle.toString());
  /// ```
  @override
  String toString() {
    final _puzzle = puzzle;
    if (_puzzle == null) {
      return 'Puzzle is null';
    }
    final puzzleStringBuffer = StringBuffer();
    final height = _puzzle.length;
    for (var i = 0; i < height; i++) {
      final row = _puzzle[i];
      final width = row.length;
      for (var j = 0; j < width; j++) {
        puzzleStringBuffer.write('${row[j] == '' ? ' ' : row[j]} ');
      }
      puzzleStringBuffer.write('\n');
    }
    return puzzleStringBuffer.toString();
  }
}

/// The solved puzzle interface
class WSSolved {
  WSSolved({
    List<WSLocation>? found,
    List<String>? notFound,
  })  : found = found ?? [],
        notFound = notFound ?? [];

  /// List of words found by solving the puzzle
  List<WSLocation> found;

  /// List of words that were not found while solving the puzzle
  List<String> notFound;
}
