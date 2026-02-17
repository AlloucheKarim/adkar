import 'package:flutter/material.dart';

class Intention {
  final String title;
  final String description;

  Intention({required this.title, required this.description});
}

class IntentionService extends ChangeNotifier {
  static final IntentionService _instance = IntentionService._internal();
  factory IntentionService() => _instance;
  IntentionService._internal();

  final List<Intention> _intentions = [
    Intention(
      title: 'الْإِخْلَاصُ فِي الْعَمَلِ',
      description:
          'أُجَدِّدُ نِيَّتِي الْيَوْمَ بِأَنْ يَكُونَ عَمَلِي لِلَّهِ خَالِصًا لِوَجْهِهِ الْكَرِيمِ، أَبْتَغِي بِهِ رِضْوَانَهُ لَا رِيَاءً وَلَا سُمْعَةً، عَسَى أَنْ يَتَقَبَّلَهُ اللَّهُ مِنِّي بِقَبُولٍ حَسَنٍ.',
    ),
    Intention(
      title: 'حُضُورُ الْقَلْبِ',
      description:
          'أَسْأَلُ اللَّهَ الْيَوْمَ أَنْ يَرْزُقَنِي حُضُورَ الْقَلْبِ فِي كُلِّ عَمَلٍ أَقُومُ بِهِ، فَلَا تَمُرُّ سَاعَاتِي غَفْلَةً، بَلْ تَكُونُ خُطُوَاتِي كُلُّهَا لِلَّهِ وَمَعَ اللَّهِ.',
    ),
    Intention(
      title: 'طَلَبُ الرِّزْقِ وَالْبَرَكَةِ',
      description:
          'أَسْتَحْضِرُ نِيَّةَ التَّوَكُّلِ عَلَى اللَّهِ فِي سَعْيِي وَرِزْقِي، فَبِالتَّوَكُّلِ تُفْتَحُ الْأَبْوَابُ، وَيَصِيرُ الْقَلِيلُ كَثِيرًا، وَتَعُمُّ الْبَرَكَةُ فِي كُلِّ جُهْدٍ أَبْذُلُهُ.',
    ),
    Intention(
      title: 'رِضَا اللَّهِ وَالْإِخْلَاصُ',
      description:
          'رَبِّ مَعَ بُزُوغِ هَذَا الْيَوْمِ أَنْوِي أَنْ أَجْعَلَ كُلَّ خُطُوَاتِي وَأَقْوَالِي وَأَفْعَالِي طَلَبًا لِرِضَاكَ، فَطَهِّرْ قَلْبِي مِنَ الرِّيَاءِ وَاجْعَلْنِي مِنَ الْمُخْلِصِينَ',
    ),
  ];

  Intention get dailyIntention =>
      _intentions[DateTime.now().day % _intentions.length];
}
