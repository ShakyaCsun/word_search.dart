import 'package:word_search/word_search.dart';

/// Orientation function interface
typedef WSOrientationFn = WSPosition Function(int x, int y, int i);

/// Check orientation function interface
typedef WSCheckOrientationFn = bool Function(int x, int y, int h, int w, int l);
