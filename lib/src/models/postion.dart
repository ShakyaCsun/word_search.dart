// Word position interface
class WSPosition {
  WSPosition({
    this.x = 0,
    this.y = 0,
  });

  /// The column position where the word starts
  final int x;

  /// The row position where the word starts
  final int y;
}
