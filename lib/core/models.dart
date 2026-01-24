enum DhikrCategory {
  morning,
  evening,
  sleep,
  afterPrayer,
  feelings,
  wakingUp,
  leavingHome,
  enteringHome,
}

class Dhikr {
  final String id;
  final DhikrCategory category;
  final String? emotionTag; // New field for emotional support
  final String arabicText;
  final String englishText; // Added translation
  final String frenchText;  // Added translation
  final String virtue; // Replaces whyToRecite and benefit
  final String sourceText;
  final String sourceRef;
  final int repetitions; // عدد مرات التكرار
  final bool isEssential; // For "Mokhtassara" mode

  const Dhikr({
    required this.id,
    required this.category,
    this.emotionTag,
    required this.arabicText,
    required this.englishText,
    required this.frenchText,
    required this.virtue,
    required this.sourceText,
    required this.sourceRef,
    this.repetitions = 1,
    this.isEssential = false,
  });
}

