extension StringExtension on String {
  /// Replaces the last space character with a non-breaking space (U+00A0)
  /// to prevent "orphans" (single words on the last line).
  String preventOrphan() {
    if (isEmpty) return this;
    final trimmed = trimRight();
    final lastSpaceIndex = trimmed.lastIndexOf(' ');
    if (lastSpaceIndex == -1) return this;

    return trimmed.replaceRange(lastSpaceIndex, lastSpaceIndex + 1, '\u00A0');
  }

  /// Removes any Kasra (\u0650) that immediately follows a Shadda (\u0651).
  /// This is used for stylistic purposes in decorative fonts like Thuluth.
  String stripKasraFromShadda() {
    if (isEmpty) return this;
    // Replace Shadda+Kasra with just Shadda
    return replaceAll('\u0651\u0650', '\u0651');
  }
}
