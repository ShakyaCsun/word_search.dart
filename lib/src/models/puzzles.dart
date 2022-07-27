import 'package:word_search/word_search.dart';

/// New puzzle interface
class WSNewPuzzle {
  /// Two dimentional list containing the puzzle
  List<List<String?>>? puzzle;

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

  WSNewPuzzle({
    this.puzzle,
    List<String>? wordsNotPlaced,
    List<String>? warnings,
    List<String>? errors,
  })  : wordsNotPlaced = wordsNotPlaced ?? [],
        warnings = warnings ?? [],
        errors = errors ?? [];

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
    String puzzleString = '';
    for (var i = 0, height = puzzle!.length; i < height; i++) {
      final List<String?> row = puzzle![i];
      for (var j = 0, width = row.length; j < width; j++) {
        puzzleString += (row[j] == '' ? ' ' : row[j])! + ' ';
      }
      puzzleString += '\n';
    }
    return puzzleString;
  }
}

/// The solved puzzle interface
class WSSolved {
  /// List of words found by solving the puzzle
  List<WSLocation> found;

  /// List of words that were not found while solving the puzzle
  List<String> notFound;

  WSSolved({
    List<WSLocation>? found,
    List<String>? notFound,
  })  : found = found ?? [],
        notFound = notFound ?? [];
}
