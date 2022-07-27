// ignore_for_file: avoid_print

import 'package:word_search/word_search.dart';

/// The main file to test out the word search library
void main() {
  print('Word Search Library!');

  // Create a list of words to be jumbled into a puzzle
  final wl = <String>['hello', 'world', 'foo', 'bar', 'baz', 'dart'];

  // Create the puzzle sessting object
  final ws = WSSettings(
    width: 10,
    height: 10,
    orientations: List.from([
      WSOrientation.horizontal,
      WSOrientation.vertical,
      WSOrientation.diagonal,
    ]),
  );

  // Create new instance of the WordSearch class
  final wordSearch = WordSearch();

  // Create a new puzzle
  final newPuzzle = wordSearch.newPuzzle(wl, ws);

  /// Check if there are errors generated while creating the puzzle
  if (newPuzzle.errors.isEmpty) {
    // The puzzle output
    print('Puzzle 2D List');
    print(newPuzzle.toString());

    // Solve puzzle for given word list
    final solved = wordSearch.solvePuzzle(newPuzzle.puzzle!, ['dart', 'word']);
    // All found words by solving the puzzle
    print('Found Words!');
    for (final element in solved.found) {
      print('word: ${element.word}, orientation: ${element.orientation}');
      print('x:${element.x}, y:${element.y}');
    }

    // All words that could not be found
    print('Not found Words!');
    for (final element in solved.notFound) {
      print('word: $element');
    }
  } else {
    // Notify the user of the errors
    for (final error in newPuzzle.errors) {
      print(error);
    }
  }
}
