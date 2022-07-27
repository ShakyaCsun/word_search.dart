import 'package:word_search/word_search.dart';

/// The puzzle settings intetface
class WSSettings {
  WSSettings({
    this.width = 0,
    this.height = 0,
    this.orientations = WSOrientation.values,
    this.fillBlanks,
    this.allowExtraBlanks = true,
    this.maxAttempts = 3,
    this.maxGridGrowth = 10,
    this.preferOverlap = true,
  });

  /// The recommended height of the puzzle
  ///
  /// **Note:** This will automatically increment if
  /// the words cannot be placed properly in the puzzle
  int height;

  /// The recommended width of the puzzle
  ///
  /// **Note:** This will automatically increment if
  /// the words cannot be placed properly in the puzzle
  int width;

  /// The allowed orientations for the words placed in the puzzle
  final List<WSOrientation> orientations;

  /// The way in which empty spaces in the puzzle should be filled
  ///
  /// If `Function` then should return a string with single character
  /// Example:
  /// ```
  /// fillBlanks: () {
  ///   final fancyStrings = '@#$%^420';
  ///   return fancyStrings[Random().nextInt(fancyStrings.length)];
  /// }
  /// ```
  ///
  /// If `String` then should contain a set of unique characters
  /// Example:
  /// ```
  /// fillBlanks: '@#$%^420',
  /// ```
  /// If `bool` it will use the default functionality
  final dynamic fillBlanks;

  /// Allow the puzzle to be filled with blanks
  final bool allowExtraBlanks;

  /// Maximum number of attempts to fit the words in the puzzle
  final int maxAttempts;

  /// Maximum numbed of times the grid can grow
  /// depending on the length of the words and placement
  final int maxGridGrowth;

  /// Allow overlaping of words in the puzzle
  final bool preferOverlap;
}
