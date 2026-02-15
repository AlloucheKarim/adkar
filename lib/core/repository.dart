import 'models.dart';

class DhikrRepository {
  static const List<Dhikr> adhkars = [
    // --- أذكار الصباح ---
    Dhikr(
      id: 'morning_kursi',
      category: DhikrCategory.morning,
      arabicText:
          'أَعُوذُ بِاللَّهِ مِنَ الشَّيطَانِ الرَّجِيمِ\nاللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهو الْعَلِيُّ الْعَظِيمُ',
      englishText:
          'Allah! There is no god but He, the Living, the Self-subsisting, Eternal. No slumber can seize Him nor sleep. His are all things in the heavens and on earth. Who is there can intercede in His presence except as He permitteth? He knoweth what (appeareth to His creatures as) before or after or behind them, nor shall they compass aught of His knowledge except as He willeth. His Throne doth extend over the heavens and the earth, and He feeleth no fatigue in guarding and preserving them for He is the Most High, the Supreme (in glory)',
      frenchText:
          'Allah ! Point de divinité à part Lui, le Vivant, Celui qui subsiste par Lui-même "Al-Qayyûm". Ni somnolence ni sommeil ne Le saisissent. À Lui appartient tout ce qui est dans les cieux et sur la terre. Qui peut intercéder auprès de Lui sans Sa permission ? Il connaît leur passé et leur futur. Et, de Sa science, ils n’embrassent que ce qu’Il veut. Son Trône "Kursî" déborde les cieux et la terre, dont la garde ne Lui coûte aucune peine. Et Il est le Très Haut, l’Immense',
      virtue:
          'هِيَ أَعْظَمُ آيَةٍ فِي كِتَابِ اللَّهِ، مَنْ قَرَأَهَا حِينَ يُصْبِحُ أُجِيرَ مِنَ الْجِنِّ حَتَّى يُمْسِيَ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ ﷺ قَالَ: "إِذَا أَوَيْتَ إِلَى فِرَاشِكَ فَاقْرَأْ آيَةَ الْكُرْسِيِّ: {اللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ...} حَتَّى تَخْتِمَ الْآيَةَ، فَإِنَّكَ لَنْ يَزَالَ عَلَيْكَ مِنَ اللَّهِ حَافِظٌ، وَلَا يَقْرَبُكَ شَيْطَانٌ حَتَّى تُصْبِحَ".',
      sourceRef: 'رَوَاهُ الْبُخَارِيُّ',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_ikhlas',
      category: DhikrCategory.morning,
      arabicText:
          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
      englishText:
          'Say: He is Allah, the One and Only. Allah, the Eternal, Absolute; He begetteth not, nor is He begotten; And there is none like unto Him',
      frenchText:
          'Dis : "Il est Allah, Unique. Allah, Le Seul à être imploré pour ce que nous désirons. Il n’a jamais engendré, n’a pas été engendré non plus. Et nul n’est égal à Lui"',
      virtue:
          'سُورَةُ الْإِخْلَاصِ تَعْدِلُ ثُلُثَ الْقُرْآنِ، وَقِرَاءَتُهَا مَعَ الْمُعَوِّذَتَيْنِ ثَلَاثاً تَكْفِيكَ مِنْ كُلِّ شَيْءٍ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ لِعَبْدِ اللَّهِ بْنِ خُبَيْبٍ رَضِيَ اللَّهُ عَنْهُ: "قُلْ: {قُلْ هُوَ اللَّهُ أَحَدٌ} وَالْمُعَوِّذَتَيْنِ حِينَ تُمْسِي وَحِينَ تُصْبِحُ ثَلَاثَ مَرَّاتٍ تَكْفِيكَ مِنْ كُلِّ شَيْءٍ".',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ وَالتِّرْمِذِيُّ',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_falaq',
      category: DhikrCategory.morning,
      arabicText:
          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ الْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
      englishText:
          'Say: I seek refuge with the Lord of the Dawn. From the mischief of created things; From the mischief of Darkness as it overspreads; From the mischief of those who blow on knots; And from the mischief of the envious one as he practises envy',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur de l’aube naissante, contre le mal des êtres qu’Il a créés, contre le mal de l’obscurité quand elle s’approfondit, contre le mal de celles qui soufflent [les sorcières] sur les nœuds, et contre le mal de l’envieux quand il envie"',
      virtue:
          'لِلِاسْتِعَاذَةِ بِاللَّهِ مِنْ شُرُورِ الْمَخْلُوقَاتِ وَالسِّحْرِ وَالْحَسَدِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "قُلْ هُوَ اللَّهُ أَحَدٌ وَالْمُعَوِّذَتَيْنِ حِينَ تُمْسِي وَحِينَ تُصْبِحُ ثَلَاثَ مَرَّاتٍ تَكْفِيكَ مِنْ كُلِّ شَيْءٍ".',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ وَالتِّرْمِذِيُّ',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_nas',
      category: DhikrCategory.morning,
      arabicText:
          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَهِ النَّاسِ، مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوسْوَسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَالنَّاسِ',
      englishText:
          'Say: I seek refuge with the Lord of Mankind, the King of Mankind, the God of Mankind, from the mischief of the Whisperer (of Evil), who withdraws (after his whisper). Who whispers into the hearts of Mankind. Among Jinns and among Men',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur des hommes, Le Souverain des hommes, Dieu des hommes, contre le mal du mauvais conseiller, furtif, qui souffle le mal dans les poitrines des hommes, qu’il [le conseiller] soit un djinn, ou un être humain"',
      virtue:
          'يُقْرَأُ مَعَ الْإِخْلَاصِ وَالْفَلَقِ ثَلَاثاً، تَكْفِيكَ مِنْ كُلِّ شَيْءٍ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ لِعَبْدِ اللَّهِ بْنِ خُبَيْبٍ رَضِيَ اللَّهُ عَنْهُ: "قُلْ: {قُلْ هُوَ اللَّهُ أَحَدٌ} وَالْمُعَوِّذَتَيْنِ حِينَ تُمْسِي وَحِينَ تُصْبِحُ ثَلَاثَ مَرَّاتٍ تَكْفِيكَ مِنْ كُلِّ شَيْءٍ".',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ وَالتِّرْمِذِيُّ',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_1',
      category: DhikrCategory.morning,
      arabicText:
          'أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هَذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هَذَا الْيَوْمِ وَشرِّ مَا بَعْدَهُ، رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ، وَسُوءِ الْكِبَرِ، رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ',
      englishText:
          'We have reached the morning and at this very time unto Allah belongs all sovereignty, and all praise is for Allah. None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent. My Lord, I ask You for the good of this day and the good of what follows it and I seek refuge in You from the evil of this day and the evil of what follows it. My Lord, I seek refuge in You from laziness and senility. My Lord, I seek refuge in You from torment in the Fire and torment in the grave',
      frenchText:
          'Nous sommes au matin et la royauté appartient à Allah. Louange à Allah. Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose. Seigneur ! Je Te demande le bien de ce jour et le bien de ce qui le suit ; et je me réfugie auprès de Toi contre le mal de ce jour et le mal de ce qui le suit. Seigneur ! Je me réfugie auprès de Toi contre la paresse et les maux de la vieillesse. Seigneur ! Je me réfugie auprès de Toi contre le châtiment du Feu et le châtiment de la tombe',
      virtue:
          'اعْتِرَافٌ بِمُلْكِ اللَّهِ الْمُطْلَقِ، وَطَلَبُ السَّكِينَةِ وَالْحِمَايَةِ مِنْ عَذَابِ الْقَبْرِ.',
      sourceText:
          'كَانَ النَّبِيُّ ﷺ إِذَا أَصْبَحَ قَالَ: "أَصْبَحْنَا وَأَصْبَحَ الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هَذَا الْيَوْمِ وَخَيْرَ مَا بَعْدَهُ، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هَذَا الْيَوْمِ وَشَرِّ مَا بَعْدَهُ، رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ وَسُوءِ الْكِبَرِ، رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ".',
      sourceRef: 'رَوَاهُ مُسْلِمٌ',
      repetitions: 1,
    ),
    Dhikr(
      id: 'morning_2',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ',
      englishText:
          'O Allah, by Your leave we have reached the morning and by Your leave we have reached the evening, by Your leave we live and die and unto You is our resurrection',
      frenchText:
          'Ô Allah ! C’est par Toi que nous sommes au matin et c’est par Toi que nous sommes au soir. C’est par Toi que nous vivons et c’est par Toi que nous mourons, et c’est vers Toi que se fera la résurrection',
      virtue: 'اعتراف بفضل الله وتدبيره للأوقات والحياة والموت.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ النَّبِيُّ ﷺ يُعَلِّمُ أَصْحَابَهُ يَقُولُ: "إِذَا أَصْبَحَ أَحَدُكُمْ فَلْيَقُلْ: اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'morning_sayyid',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لاَ يَغْفِرُ الذُّنُوبَ إِلاَّ أَنْتَ',
      englishText:
          'O Allah, You are my Lord, none has the right to be worshipped except You. You created me and I am Your servant, and I abide by Your covenant and promise as best I can. I seek refuge in You from the evil of what I have done. I acknowledge Your favor upon me and I acknowledge my sin, so forgive me, for none forgives sins except You',
      frenchText:
          'Ô Allah ! Tu es mon Seigneur, il n’y a de divinité que Toi. C’est Toi qui m’as créé et je suis Ton serviteur. Je suis Ton engagement et Ta promesse autant que je le puis. Je me réfugie auprès de Toi contre le mal de ce que j’ai fait. Je reconnais Tes bienfaits envers moi et je reconnais mon péché. Pardonne-moi donc, car nul ne pardonne les péchés si ce n’est Toi',
      virtue:
          'سَيِّدُ الِاسْتِغْفَارِ، مَنْ قَالَهُ مُوقِنًا بِهِ وَمَاتَ مِنْ يَوْمِهِ دَخَلَ الْجَنَّةَ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "سَيِّدُ الِاسْتِغْفَارِ أَنْ تَقُولَ: اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ لَكَ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ. قَالَ: وَمَنْ قَالَهَا مِنَ النَّهَارِ مُوقِنًا بِهَا، فَمَاتَ مِنْ يَوْمِهِ قَبْلَ أَنْ يُمْسِيَ، فَهُوَ مِنْ أَهْلِ الْجَنَّةِ، وَمَنْ قَالَهَا مِنَ اللَّيْلِ وَهُوَ مُوقِنٌ بِهَا، فَمَاتَ قَبْلَ أَنْ يُصْبِحَ، فَهُوَ مِنْ أَهْلِ الْجَنَّةِ".',
      sourceRef: 'رَوَاهُ الْبُخَارِيُّ',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_testimony',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ إِنِّي أَصْبَحْتُ أُشْهِدُكَ، وَأُشْهِدُ حَمَلَةَ عَرْشِكَ، وَمَلَائِكَتَكَ، وَجَمِيعَ خَلْقِكَ، أَنَّكَ أَنْتَ اللَّهُ لَا إِلَهَ إِلَّا أَنْتَ وَحْدَكَ لَا شَرِيكَ لَكَ، وَأَنَّ مُحَمَّدًا عَبْدُكَ وَرَسُولُكَ',
      englishText:
          "O Allah, I have entered the morning and I call upon You, the bearers of Your Throne, Your angels and all of Your creation to witness that surely You are Allah, there is none worthy of worship but You alone, You have no partners, and that Muhammad is Your slave and Your Messenger",
      frenchText:
          "Ô Allah ! Me voici au matin, je Te prends à témoin, et je prends à témoin les porteurs de Ton Trône, Tes anges et toute Ta création, pour témoigner que Tu es Allah, nulle divinité ne mérite d'être adorée à part Toi, l'Unique sans associé, et que Muhammad est Ton serviteur et Ton Messager",
      virtue:
          'مَنْ قَالَهَا أَرْبَعَ مَرَّاتٍ حِينَ يُصْبِحُ أَعْتَقَهُ اللَّهُ مِنَ النَّارِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ حِينَ يُصْبِحُ أَوْ يُمْسِي: اللَّهُمَّ إِنِّي أَصْبَحْتُ أُشْهِدُكَ... أَعْتَقَهُ اللَّهُ مِنَ النَّارِ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 4,
    ),
    Dhikr(
      id: 'morning_shukr',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ مَا أَصْبَحَ بِي مِنْ نِعْمَةٍ أَوْ بِأَحَدٍ مِنْ خَلْقِكَ فَمِنْكَ وَحْدَكَ لَا شَرِيكَ لَكَ، فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ',
      englishText:
          'O Allah, whatever blessing has been received by me or by any of Your creatures in the morning is from You alone, without partner. To You belongs all praise and to You belongs all thanks',
      frenchText:
          'Ô Allah ! Tout bienfait qui m’arrive à moi ou à l’une de Tes créatures en ce matin provient de Toi seul, sans associé. À Toi la louange et à Toi le remerciement',
      virtue: 'مَنْ قَالَهَا حِينَ يُصْبِحُ فَقَدْ أَدَّى شُكْرَ يَوْمِهِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ حِينَ يُصْبِحُ: اللَّهُمَّ مَا أَصْبَحَ بِي مِنْ نِعْمَةٍ، أَوْ بِأَحَدٍ مِنْ خَلْقِكَ فَمِنْكَ وَحْدَكَ لَا شَرِيكَ لَكَ، فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ، فَقَدْ أَدَّى شُكْرَ يَوْمِهِ، وَمَنْ قَالَ مِثْلَ ذَلِكَ حِينَ يُمْسِي فَقَدْ أَدَّى شُكْرَ لَيْلَتِهِ".',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ',
      repetitions: 1,
    ),
    Dhikr(
      id: 'morning_hasbi',
      category: DhikrCategory.morning,
      arabicText:
          'حَسْبِيَ اللَّهُ لَا إِلَهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
      frenchText:
          'Allah me suffit. Il n’y a de divinité que Lui. C’est en Lui que je place ma confiance et Il est le Seigneur du Trône Immense',
      englishText:
          'Allah is sufficient for me. None has the right to be worshipped except Him. In Him I put my trust and He is the Lord of the Mighty Throne',
      virtue:
          'مَنْ قَالَهَا سَبْعَ مَرَّاتٍ كَفَاهُ اللَّهُ مَا أَهَمَّهُ مِنْ أَمْرِ الدُّنْيَا وَالْآخِرَةِ.',
      sourceText:
          'عَنْ أَبِي الدَّرْدَاءِ رَضِيَ اللَّهُ عَنْهُ قَالَ: "مَنْ قَالَ إِذَا أَصْبَحَ وَإِذَا أَمْسَى: حَسْبِيَ اللَّهُ لَا إِلَهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ، سَبْعَ مَرَّاتٍ، كَفَاهُ اللَّهُ مَا أَهَمَّهُ صَادِقاً كَانَ بِهَا أَوْ كَاذِباً".',
      sourceRef: 'رواه ابن السني',
      repetitions: 7,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_aafiyah_2',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ، اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ: فِي دِينِي وَدُنْيَايَ وَأَهْلِي، وَمَالِي، اللَّهُمَّ اسْتُرْ عَوْرَاتِي، وَآمِنْ رَوْعَاتِي، اللَّهُمَّ احْفَظْنِي مِنْ بَيْنِ يَدَيَّ، وَمِنْ خَلْفِي، وَعَنْ يَمِينِي، وَعَنْ شِمَالِي، وَمِنْ فَوْقِي، وَأَعُوذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِي',
      frenchText:
          'Ô Allah ! Je Te demande le pardon et le salut dans ma religion, ma vie ici-bas, ma famille et mes biens. Ô Allah ! Cache mes défauts et apaise mes craintes. Ô Allah ! Protège-moi par devant, par derrière, sur ma droite, sur ma gauche et au-dessus de moi. Et je me réfugie auprès de Ta grandeur contre le fait d’être englouti par-dessous moi',
      englishText:
          'O Allah, I ask You for pardon and well-being in this world and the next. O Allah, I ask You for pardon and well-being in my religion and my worldly affairs, and in my family and my property. O Allah, conceal my faults and soothe my fears. O Allah, guard me from the front and from behind, from my right and from my left, and from above me, and I seek refuge in Your Greatness lest I be swallowed up from beneath me',
      virtue:
          'دُعَاءٌ لِلْحِفْظِ الْإِلَهِيِّ مِنَ الْجِهَاتِ السِّتِّ وَلِسَتْرِ الْعَوْرَاتِ وَالْأَمْنِ مِنَ الرَّوْعِ.',
      sourceText:
          'عَنِ ابْنِ عُمَرَ رَضِيَ اللَّهُ عَنْهُمَا قَالَ: لَمْ يَكُنْ رَسُولُ اللَّهِ ﷺ يَدَعُ هَؤُلَاءِ الدَّعَوَاتِ حِينَ يُمْسِي وَحِينَ يُصْبِحُ: "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ...".',
      sourceRef: 'رواه أبو داود وابن ماجه',
      repetitions: 1,
    ),
    Dhikr(
      id: 'morning_afiyah',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ عَافِنِي فِي بَدَنِي، اللَّهُمَّ عَافِنِي فِي سَمْعِي، اللَّهُمَّ عَافِنِي فِي بَصَرِي، لَا إِلَهَ إِلَّا أَنْتَ. اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكُفْرِ، وَالْفَقْرِ، وَأَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، لَا إِلَهَ إِلَّا أَنْتَ',
      frenchText:
          'Ô Allah ! Préserve ma santé dans mon corps, mon ouïe et ma vue. Il n’y a de divinité que Toi. Ô Allah ! Je me réfugie auprès de Toi contre la mécréance et la pauvreté, et je me réfugie auprès de Toi contre le châtiment de la tombe. Il n’y a de divinité que Toi',
      englishText:
          'O Allah, make me healthy in my body, my hearing and my sight. None has the right to be worshipped except You. O Allah, I seek refuge in You from disbelief and poverty, and I seek refuge in You from the torment of the grave. None has the right to be worshipped except You',
      virtue:
          'طَلَبُ الْعَافِيَةِ وَالْوِقَايَةِ مِنَ الْفَقْرِ وَعَذَابِ الْقَبْرِ.',
      sourceText:
          'عَنْ عَبْدِ الرَّحْمَنِ بْنِ أَبِي بَكْرَةَ قَالَ لِأَبِيهِ: يَا أَبَتِ إِنِّي أَسْمَعُكَ تَدْعُو كُلَّ صَبَاحٍ: اللَّهُمَّ عَافِنِي فِي بَدَنِي... .',
      sourceRef: 'رواه أبو داود',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_bismillah',
      category: DhikrCategory.morning,
      arabicText:
          'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهو السَّمِيعُ الْعَلِيمُ',
      englishText:
          'In the Name of Allah, Who with His Name nothing can cause harm in the earth nor in the heavens, and He is the All-Hearing, the All-Knowing',
      frenchText:
          'Au nom d’Allah, tel qu’en compagnie de Son Nom rien ne peut nuire sur terre ni dans le ciel, et Il est l’Audient, l’Omniscient',
      virtue: 'تحصين شامل، من قاله ثلاث مرات لم يضره شيء.',
      sourceText:
          'عَنْ عُثْمَانَ بْنِ عَفَّانَ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ رَسُولُ اللَّهِ ﷺ: "مَا مِنْ عَبْدٍ يَقُولُ فِي صَبَاحِ كُلِّ يَوْمٍ وَمَسَاءِ كُلِّ لَيْلَةٍ: بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ ثَلَاثَ مَرَّاتٍ لَمْ يَضُرَّهُ شَيْءٌ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_raditu',
      category: DhikrCategory.morning,
      arabicText:
          'رَضِيتُ بِاللَّهِ رَبَّاً، وَبِالْإِسْلَامِ دِيناً، وَبِمُحَمَّدٍ ﷺ نَبِيَّاً',
      englishText:
          'I am pleased with Allah as my Lord, with Islam as my religion and with Muhammad (peace and blessings of Allah be upon him) as my Prophet',
      frenchText:
          'J’ai agréé Allah comme Seigneur, l’Islam comme religion et Muhammad (salut et bénédictions d’Allah sur lui) comme Prophète',
      virtue:
          'كَانَ النَّبِيُّ ﷺ يَضَعُ يَدَهُ الْيُمْنَى تَحْتَ خَدِّهِ وَيَقُولُهَا ثَلَاثاً.',
      sourceText:
          'قال رسول الله ﷺ: "من قال حين يصبح: رضيت بالله رباً، وبالإسلام ديناً، وبمحمد ﷺ نبياً، ثلاث مرات، كان حقاً على الله أن يرضيه يوم القيامة".',
      sourceRef: 'رواه الترمذي',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'morning_ya_hayyu',
      category: DhikrCategory.morning,
      arabicText:
          'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ',
      frenchText:
          'Ô Vivant ! Ô Celui qui subsiste par Lui-même ! C’est par Ta miséricorde que j’appelle au secours. Améliore ma situation entière et ne me laisse pas à mon propre sort, ne serait-ce que le temps d’un clin d’œil',
      englishText:
          'O Ever Living, O Self-Subsisting, by Your mercy I seek help. Amend for me all my affairs and do not leave me to myself even for the blinking of an eye',
      virtue:
          'وَصِيَّةٌ نَبَوِيَّةٌ لِلِاسْتِغَاثَةِ بِأَسْمَاءِ اللَّهِ الْعُظْمَى لِكِفَايَةِ الْهَمِّ.',
      sourceText:
          'قال رسول الله ﷺ لفاطمة رضي الله عنها: "ما يمنعك أن تسمعي ما أوصيك به، أو تقولي إذا أصبحت وإذا أمسيت: يا حي يا قيوم برحمتك أستغيث، أصلح لي شأني كله، ولا تكلني إلى نفسي طرفة عين".',
      sourceRef: 'رواه النسائي',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_abu_bakr',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ عَالِمَ الْغَيْبِ وَالشَّهَادَةِ، فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ، رَبَّ كُلِّ شَيْءٍ وَمَلِيكَهُ، أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا أَنْتَ، أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي، وَمِنْ شَرِّ الشَّيْطَانِ وَشِرْكِهِ، وَأَنْ أَقْتَرِفَ عَلَى نَفْسِي سُوءًا، أَوْ أَجُرَّهُ إِلَى مُسْلِمٍ',
      englishText:
          "O Allah, Knower of the unseen and the seen, Creator of the heavens and the earth, Lord and Sovereign of all things. I bear witness that none has the right to be worshipped except You. I seek refuge in You from the evil of my soul and from the evil and shirk of the devil, and from committing any wrong against myself or bringing it upon another Muslim",
      frenchText:
          "Ô Allah ! Toi qui connais l'Inconnu et le Témoigné, Créateur des cieux et de la terre, Seigneur et Souverain de toute chose. Je témoigne qu'il n'y a de divinité que Toi. Je me réfugie auprès de Toi contre le mal de mon âme, contre le mal de Satan et de son polythéisme, et contre le fait de me faire du mal à moi-même ou d'en faire à un autre musulman",
      virtue:
          'يُقَالُ فِي الصَّبَاحِ وَالْمَسَاءِ وَعِنْدَ النَّوْمِ لِلْحِفْظِ مِنَ الشُّرُورِ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ أَنَّ أَبَا بَكْرٍ الصِّدِّيقَ قَالَ: يَا رَسُولَ اللَّهِ، مُرْنِي بِكَلِمَاتٍ أَقُولُهُنَّ إِذَا أَصْبَحْتُ وَإِذَا أَمْسَيْتُ...',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'morning_fitra',
      category: DhikrCategory.morning,
      arabicText:
          'أَصْبَحْنَا عَلَى فِطْرَةِ الْإِسْلَامِ، وَعَلَى كَلِمَةِ الْإِخْلَاصِ، وَعَلَى دِينِ نَبِيِّنَا مُحَمَّدٍ ﷺ، وَعَلَى مِلَّةِ أَبِينَا إِبْرَاهِيمَ، حَنِيفًا مُسْلِمًا وَمَا كَانَ مِنَ الْمُشْرِكِينَ',
      englishText:
          "We have entered the morning upon the natural religion of Islam, the word of sincere devotion, the religion of our Prophet Muhammad (peace and blessings of Allah be upon him), and the faith of our father Ibrahim, a man of pure belief and a Muslim, and he was not of those who worship others besides Allah",
      frenchText:
          "Nous voici au matin, sur la saine nature de l'Islam, sur la parole du dévouement sincère, sur la religion de notre Prophète Muhammad (salut et bénédictions d'Allah sur lui) et sur la confession de notre père Ibrahim, qui était un pur monothéiste, soumis à Allah, et n'était point du nombre des associateurs",
      virtue:
          'تَدْجِيدُ الْعَهْدِ مَعَ اللَّهِ عَلَى الْفِطْرَةِ وَالتَّوْحِيدِ وَالِاتِّبَاعِ.',
      sourceText:
          'عَنْ عَبْدِ الرَّحْمَنِ بْنِ أَبْزَى رَضِيَ اللَّهُ عَنْهُ عَنِ النَّبِيِّ ﷺ كَانَ يَقُولُ إِذَا أَصْبَحَ: "أَصْبَحْنَا عَلَى فِطْرَةِ الْإِسْلَامِ...".',
      sourceRef: 'رواه أحمد والترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'morning_subhan',
      category: DhikrCategory.morning,
      arabicText:
          'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ: عَدَدَ خَلْقِهِ، وَرِضَا نَفْسِهِ، وَزِنَةَ عَرْشِهِ، وَمِدَادَ كَلِمَاتِهِ',
      frenchText:
          'Gloire et louange à Allah, autant de fois qu’Il a de créatures, autant qu’Il Lui plaît, autant que pèse Son Trône et autant qu’il faudrait d’encre pour écrire Ses paroles',
      englishText:
          'Glory is to Allah and praise is to Him, by the multitude of His creation, by His Pleasure, by the weight of His Throne, and by the extent of His Words',
      virtue:
          'كَلِمَاتٌ تَعْدِلُ فِي أَجْرِهَا الذِّكْرَ الطَّوِيلَ الْمُتَوَاصِلَ لِفَضْلِهَا عِنْدَ اللَّهِ.',
      sourceText:
          'عَنْ جُوَيْرِيَةَ بِنْتِ الْحَارِثِ رَضِيَ اللَّهُ عَنْهَا أَنَّ النَّبِيَّ ﷺ خَرَجَ مِنْ عِنْدِهَا بُكْرَةً حِينَ صَلَّى الصُّبْحَ، وَهِيَ فِي مَسْجِدِهَا، ثُمَّ رَجَعَ بَعْدَ أَنْ أَضْحَى، وَهِيَ جَالِسَةٌ، فَقَالَ: "مَا زِلْتِ عَلَى الْحَالَةِ الَّتِي فَارَقْتُكِ عَلَيْهَا؟" قَالَتْ: نَعَمْ، قَالَ النَّبِيُّ ﷺ: "لَقَدْ قُلْتُ بَعْدَكِ أَرْبَعَ كَلِمَاتٍ، ثَلَاثَ مَرَّاتٍ، لَوْ وُزِنَتْ بِمَا قُلْتِ مُنْذُ الْيَوْمِ لَوَزَنَتْهُنَّ: سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، عَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ وَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ".',
      sourceRef: 'رَوَاهُ مُسْلِمٌ',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_istighfar_grand',
      category: DhikrCategory.morning,
      arabicText:
          'أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيَّ الْقَيُّومَ وَأَتُوبُ إِلَيْهِ',
      englishText:
          "I seek the forgiveness of Allah the Mighty, whom there is none worthy of worship except Him, the Living, the Eternal, and I repent to Him",
      frenchText:
          "Je demande pardon à Allah l'Immense, en dehors duquel il n'y a pas d'autre divinité, le Vivant, Celui qui subsiste par Lui-même, et je me repens à Lui",
      virtue: 'مَنْ قَالَهَا غُفِرَ لَهُ وَإِنْ كَانَ فَرَّ مِنَ الزَّحْفِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ: أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيَّ الْقَيُّومَ وَأَتُوبُ إِلَيْهِ، غُفِرَ لَهُ وَإِنْ كَانَ فَرَّ مِنَ الزَّحْفِ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_shirk_protection',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ شَيْئًا أَعْلَمُهُ، وَأَسْتَغْفِرُكَ لِمَا لَا أَعْلَمُهُ',
      frenchText:
          'Ô Allah ! Je cherche protection auprès de Toi contre le fait de T’associer quoi que ce soit alors que je le sais, et je Te demande pardon pour ce que je ne sais pas',
      englishText:
          'O Allah, I seek refuge in You lest I should associate anything with You while I know it, and I seek Your forgiveness for what I do not know',
      virtue: 'حماية من الشرك الأصغر والخفي، ويذهب عنك كبير الشرك وصغيره.',
      sourceText:
          'قَالَ ﷺ: "أَلَا أَدُلُّكَ عَلَى شَيْءٍ إِذَا قُلْتَهُ ذَهَبَ عَنْكَ قَلِيلُ الشِّرْكِ وَكَثِيرُهُ؟ قُلْ: اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ شَيْئاً أَعْلَمُهُ وَأَسْتَغْفِرُكَ لِمَا لَا أَعْلَمُهُ".',
      sourceRef: 'رواه أحمد',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_ilman_nafian',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ عِلْمًا نَافِعًا، وَرِزْقًا طَيِّبًا، وَعَمَلًا مُتَقَبَّلًا',
      frenchText:
          'Ô Allah ! Je Te demande un savoir utile, une subsistance bonne et une œuvre agréée',
      englishText:
          'O Allah, I ask You for knowledge that is of benefit, a good provision, and deeds that will be accepted',
      virtue:
          'يقال بعد صلاة الصبح، وهو طلب لأصول النجاح في اليوم: العلم والرزق والعمل.',
      sourceText:
          'كان النبي ﷺ يقول إذا صلى الصبح حين يسلم: "اللهم إني أسألك علماً نافعاً، ورزقاً طيباً، وعملاً متقبلاً".',
      sourceRef: 'رواه ابن ماجه',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_hamm_hazan',
      category: DhikrCategory.morning,
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ، وَغَلَبَةِ الرِّجَالِ',
      frenchText:
          'Ô Allah ! Je me protège auprès de Toi contre l’anxiété et la tristesse, l’incapacité et la paresse, l’avarice et la lâcheté, le poids de la dette et la domination des hommes',
      englishText:
          'O Allah, I seek refuge in You from anxiety and sorrow, weakness and laziness, miserliness and cowardice, the burden of debts and from being overpowered by men',
      virtue:
          'اسْتِعَاذَةٌ شَامِلَةٌ مِنْ آفَاتِ الْقُلُوبِ وَالْأَبْدَانِ وَالدُّيُونِ.',
      sourceText:
          'عن أنس بن مالك رضي الله عنه قال: كان النبي ﷺ يكثر أن يقول: "اللهم إني أعوذ بك من الهم والحزن، والعجز والكسل، والبخل والجبن، وضلع الدين، وغلبة الرجال".',
      sourceRef: 'رواه البخاري',
      repetitions: 3,
    ),
    Dhikr(
      id: 'morning_salat_alanabi',
      category: DhikrCategory.morning,
      arabicText: 'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
      englishText: 'O Allah, send prayers and peace upon our Prophet Muhammad',
      frenchText: 'Ô Allah, prie sur notre Prophète Muhammad et salue-le',
      virtue:
          'مَنْ صَلَّى عَلَيَّ حِينَ يُصْبِحُ عَشْراً وَحِينَ يُمْسِي عَشْراً أَدْرَكَتْهُ شَفَاعَتِي يَوْمَ الْقِيَامَةِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ صَلَّى عَلَيَّ حِينَ يُصْبِحُ عَشْراً، وَحِينَ يُمْسِي عَشْراً، أَدْرَكَتْهُ شَفَاعَتِي يَوْمَ الْقِيَامَةِ".',
      sourceRef: 'رواه الطبراني',
      repetitions: 10,
    ),
    Dhikr(
      id: 'morning_tahlil_100',
      category: DhikrCategory.morning,
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
      frenchText:
          'Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose',
      englishText:
          'None has the right to be worshipped except Allah, alone, without partner. To Him belongs all sovereignty and praise and He is over all things omnipotent',
      virtue: 'كانت له عدل عشر رقاب، وكتبت له مائة حسنة، ومحيت عنه مائة سيئة.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، فِي يَوْمٍ مِائَةَ مَرَّةٍ، كَانَتْ لَهُ عَدْلَ عَشْرِ رِقَابٍ، وَكُتِبَتْ لَهُ مِائَةُ حَسَنَةٍ، وَمُحِيَتْ عَنْهُ مِائَةُ سَيِّئَةٍ، وَكَانَتْ لَهُ حِرْزاً مِنَ الشَّيْطَانِ يَوْمَهُ ذَلِكَ حَتَّى يُمْسِيَ، وَلَمْ يَأْتِ أَحَدٌ بِأَفْضَلَ مِمَّا جَاءَ بِهِ إِلَّا رَجُلٌ عَمِلَ أَكْثَرَ مِنْهُ".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 10,
    ),
    Dhikr(
      id: 'morning_astaghfir',
      category: DhikrCategory.morning,
      arabicText: 'أَسْتَغْفِرُ اللَّهَ وَأَتُوبُ إِلَيْهِ',
      englishText: 'I seek Allah’s forgiveness and I turn in repentance to Him',
      frenchText: 'Je demande pardon à Allah et je me repens à Lui',
      virtue: 'امتثال لسنة النبي ﷺ الذي كان يستغفر باليوم مائة مرة.',
      sourceText:
          'قال ﷺ: "يا أيها الناس توبوا إلى الله فإني أتوب في اليوم مائة مرة".',
      sourceRef: 'رواه مسلم',
      repetitions: 10,
    ),
    Dhikr(
      id: 'morning_tasbih_100',
      category: DhikrCategory.morning,
      arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      englishText: 'Glory is to Allah and praise is to Him',
      frenchText: 'Gloire et louange à Allah',
      virtue:
          'مَنْ قَالَهَا مِائَةَ مَرَّةٍ حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ فِي يَوْمِهِ مِائَةَ مَرَّةٍ... حُطَّتْ خَطَايَاهُ".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 100,
    ),

    // --- أذكار المساء ---
    Dhikr(
      id: 'evening_kursi',
      category: DhikrCategory.evening,
      arabicText:
          'أَعُوذُ بِاللَّهِ مِنَ الشَّيطَانِ الرَّجِيمِ\nاللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهو الْعَلِيُّ الْعَظِيمُ',
      englishText:
          'Allah! There is no god but He, the Living, the Self-subsisting, Eternal. No slumber can seize Him nor sleep. His are all things in the heavens and on earth. Who is there can intercede in His presence except as He permitteth? He knoweth what (appeareth to His creatures as) before or after or behind them, nor shall they compass aught of His knowledge except as He willeth. His Throne doth extend over the heavens and the earth, and He feeleth no fatigue in guarding and preserving them for He is the Most High, the Supreme (in glory)',
      frenchText:
          'Allah ! Point de divinité à part Lui, le Vivant, Celui qui subsiste par Lui-même "Al-Qayyûm". Ni somnolence ni sommeil ne Le saisissent. À Lui appartient tout ce qui est dans les cieux et sur la terre. Qui peut intercéder auprès de Lui sans Sa permission ? Il connaît leur passé et leur futur. Et, de Sa science, ils n’embrassent que ce qu’Il veut. Son Trône "Kursî" déborde les cieux et la terre, dont la garde ne Lui coûte aucune peine. Et Il est le Très Haut, l’Immense',
      virtue:
          'لحفظ المسلم من أذى الشياطين طوال الليل، من قرأها أجير من الجن حتى يصبح.',
      sourceText:
          'عَنْ أُبَيِّ بْنِ كَعْبٍ رَضِيَ اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ ﷺ قَالَ فِي فَضْلِ آيَةِ الْكُرْسِيِّ فِي الْمَسَاءِ: "مَنْ قَالَهَا حِينَ يُمْسِي أُجِيرَ مِنَ الْجِنِّ حَتَّى يُصْبِحَ، وَمَنْ قَالَهَا حِينَ يُصْبِحُ أُجِيرَ مِنْهُمْ حَتَّى يُمْسِيَ".',
      sourceRef: 'رواه النسائي',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_ikhlas',
      category: DhikrCategory.evening,
      arabicText:
          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
      englishText:
          'Say: He is Allah, the One and Only. Allah, the Eternal, Absolute; He begetteth not, nor is He begotten; And there is none like unto Him',
      frenchText:
          'Dis : "Il est Allah, Unique. Allah, Le Seul à être imploré pour ce que nous désirons. Il n’a jamais engendré, n’a pas été engendré non plus. Et nul n’est égal à Lui"',
      virtue:
          'قِرَاءَتُهَا مَعَ الْمُعَوِّذَتَيْنِ ثَلَاثاً تَكْفِيكَ مِنْ كُلِّ سُوءٍ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "قُلْ هُوَ اللَّهُ أَحَدٌ وَالْمُعَوِّذَتَيْنِ حِينَ تُمْسِي وَحِينَ تُصْبِحُ ثَلَاثَ مَرَّاتٍ تَكْفِيكَ مِنْ كُلِّ شَيْءٍ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_falaq',
      category: DhikrCategory.evening,
      arabicText:
          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ الْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
      englishText:
          'Say: I seek refuge with the Lord of the Dawn. From the mischief of created things; From the mischief of Darkness as it overspreads; From the mischief of those who blow on knots; And from the mischief of the envious one as he practises envy',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur de l’aube naissante, contre le mal des êtres qu’Il a créés, contre le mal de l’obscurité quand elle s’approfondit, contre le mal de celles qui soufflent [les sorcières] sur les nœuds, et contre le mal de l’envieux quand il envie"',
      virtue: 'حِمَايَةٌ مِنْ كُلِّ شَرٍّ وَسِحْرٍ وَحَسَدٍ فِي اللَّيْلِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "قُلْ هُوَ اللَّهُ أَحَدٌ وَالْمُعَوِّذَتَيْنِ حِينَ تُمْسِي وَحِينَ تُصْبِحُ ثَلَاثَ مَرَّاتٍ تَكْفِيكَ مِنْ كُلِّ شَيْءٍ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_nas',
      category: DhikrCategory.evening,
      arabicText:
          'بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَهِ النَّاسِ، مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوسْوَسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَالنَّاسِ',
      englishText:
          'Say: I seek refuge with the Lord of Mankind, the King of Mankind, the God of Mankind, from the mischief of the Whisperer (of Evil), who withdraws (after his whisper). Who whispers into the hearts of Mankind. Among Jinns and among Men',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur des hommes, Le Souverain des hommes, Dieu des hommes, contre le mal du mauvais conseiller, furtif, qui souffle le mal dans les poitrines des hommes, qu’il [le conseiller] soit un djinn, ou un être humain"',
      virtue: 'حِمَايَةٌ مِنْ وَسَاوِسِ الشَّيَاطِينِ وَمِنْ شَرِّ الْجِنَّةِ وَالنَّاسِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ لِعَبْدِ اللَّهِ بْنِ خُبَيْبٍ رَضِيَ اللَّهُ عَنْهُ: "قُلْ: {قُلْ هُوَ اللَّهُ أَحَدٌ} وَالْمُعَوِّذَتَيْنِ حِينَ تُمْسِي وَحِينَ تُصْبِحُ ثَلَاثَ مَرَّاتٍ تَكْفِيكَ مِنْ كُلِّ شَيْءٍ".',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ وَالتِّرْمِذِيُّ',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_1',
      category: DhikrCategory.evening,
      arabicText:
          'أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هَذِهِ اللَّيْلَةِ وَخَيْرَ مَا بَعْدَهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هَذِهِ اللَّيْلَةِ وَشرِّ مَا بَعْدَهَا، رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ، وَسُوءِ الْكِبَرِ، رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ',
      englishText:
          'We have reached the evening and at this very time unto Allah belongs all sovereignty, and all praise is for Allah. None has the right to be worshipped except Allah, alone, without partner, to Him belongs all sovereignty and praise and He is over all things omnipotent. My Lord, I ask You for the good of this night and the good of what follows it and I seek refuge in You from the evil of this night and the evil of what follows it. My Lord, I seek refuge in You from laziness and senility. My Lord, I seek refuge in You from torment in the Fire and torment in the grave',
      frenchText:
          'Nous sommes au soir et la royauté appartient à Allah. Louange à Allah. Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose. Seigneur ! Je Te demande le bien de cette nuit et le bien de ce qui la suit ; et je me réfugie auprès de Toi contre le mal de cette nuit et le mal de ce qui la suit. Seigneur ! Je me réfugie auprès de Toi contre la paresse et les maux de la vieillesse. Seigneur ! Je me réfugie auprès de Toi contre le châtiment du Feu et le châtiment de la tombe',
      virtue:
          'تَسْلِيمُ النَّفْسِ لِلَّهِ وَطَلَبُ الْعَافِيَةِ، وَهِيَ حِصْنٌ حَصِينٌ خِلَالَ سَاعَاتِ اللَّيْلِ.',
      sourceText:
          'كَانَ النَّبِيُّ ﷺ إِذَا أَمْسَى قَالَ: "أَمْسَيْنَا وَأَمْسَى الْمُلْكُ لِلَّهِ، وَالْحَمْدُ لِلَّهِ، لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، رَبِّ أَسْأَلُكَ خَيْرَ مَا فِي هَذِهِ اللَّيْلَةِ وَخَيْرَ مَا بَعْدَهَا، وَأَعُوذُ بِكَ مِنْ شَرِّ مَا فِي هَذِهِ اللَّيْلَةِ وَشَرِّ مَا بَعْدَهَا، رَبِّ أَعُوذُ بِكَ مِنَ الْكَسَلِ وَسُوءِ الْكِبَرِ، رَبِّ أَعُوذُ بِكَ مِنْ عَذَابٍ فِي النَّارِ وَعَذَابٍ فِي الْقَبْرِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'evening_2',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ الْمَصِيرُ',
      englishText:
          'O Allah, by Your leave we have reached the evening and by Your leave we have reached the morning, by Your leave we live and die and unto You is our return',
      frenchText:
          'Ô Allah ! C’est par Toi que nous sommes au soir et c’est par Toi que nous sommes au matin. C’est par Toi que nous vivons et c’est par Toi que nous mourons, et c’est vers Toi que se fera le retour',
      virtue:
          'اعْتِرَافٌ بِفَضْلِ اللَّهِ وَتَدْبِيرِهِ لِلْأَوْقَاتِ وَالْحَيَاةِ وَالْمَوْتِ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ النَّبِيُّ ﷺ يُعَلِّمُ أَصْحَابَهُ يَقُولُ: "إِذَا أَصْبَحَ أَحَدُكُمْ فَلْيَقُلْ: اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ، وَإِذَا أَمْسَى فَلْيَقُلْ: اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ الْمَصِيرُ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'evening_sayyid',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ أَنْتَ رَبِّي لاَ إِلَهَ إِلاَّ أَنْتَ، خَلَقْتَنِي وَأَنَا عَبْدُكَ، وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ، أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ، وَأَبُوءُ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لاَ يَغْفِرُ الذُّنُوبَ إِلاَّ أَنْتَ',
      englishText:
          'O Allah, You are my Lord, none has the right to be worshipped except You. You created me and I am Your servant, and I abide by Your covenant and promise as best I can. I seek refuge in You from the evil of what I have done. I acknowledge Your favor upon me and I acknowledge my sin, so forgive me, for none forgives sins except You',
      frenchText:
          'Ô Allah ! Tu es mon Seigneur, il n’y a de divinité que Toi. C’est Toi qui m’as créé et je suis Ton serviteur. Je suis Ton engagement et Ta promesse autant que je le puis. Je me réfugie auprès de Toi contre le mal de ce que j’ai fait. Je reconnais Tes bienfaits envers moi et je reconnais mon péché. Pardonne-moi donc, car nul ne pardonne les péchés si ce n’est Toi',
      virtue: 'سيد الاستغفار، من قاله موقناً به ومات من ليلته دخل الجنة.',
      sourceText:
          'قال رسول الله ﷺ: "سيد الاستغفار أن تقول: اللهم أنت ربي..." فذكر الحديث.',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_testimony',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ إِنِّي أَمْسَيْتُ أُشْهِدُكَ، وَأُشْهِدُ حَمَلَةَ عَرْشِكَ، وَمَلَائِكَتَكَ، وَجَمِيعَ خَلْقِكَ، أَنَّكَ أَنْتَ اللَّهُ لَا إِلَهَ إِلَّا أَنْتَ وَحْدَكَ لَا شَرِيكَ لَكَ، وَأَنَّ مُحَمَّدًا عَبْدُكَ وَرَسُولُكَ',
      englishText:
          "O Allah, I have entered the evening and I call upon You, the bearers of Your Throne, Your angels and all of Your creation to witness that surely You are Allah, there is none worthy of worship but You alone, You have no partners, and that Muhammad is Your slave and Your Messenger",
      frenchText:
          "Ô Allah ! Me voici au soir, je Te prends à témoin, et je prends à témoin les porteurs de Ton Trône, Tes anges et toute Ta création, pour témoigner que Tu es Allah, nulle divinité ne mérite d'être adorée à part Toi, l'Unique sans associé, et que Muhammad est Ton serviteur et Ton Messager",
      virtue:
          'مَنْ قَالَهَا أَرْبَعَ مَرَّاتٍ حِينَ يُمْسِي أَعْتَقَهُ اللَّهُ مِنَ النَّارِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ حِينَ يُصْبِحُ أَوْ يُمْسِي: اللَّهُمَّ إِنِّي أَمْسَيْتُ أُشْهِدُكَ... أَعْتَقَهُ اللَّهُ مِنَ النَّارِ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 4,
    ),
    Dhikr(
      id: 'evening_shukr',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ مَا أَمْسَى بِي مِنْ نِعْمَةٍ أَوْ بِأَحَدٍ مِنْ خَلْقِكَ فَمِنْكَ وَحْدَكَ لَا شَرِيكَ لَكَ، فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ',
      englishText:
          'O Allah, whatever blessing has been received by me or by any of Your creatures in the evening is from You alone, without partner. To You belongs all praise and to You belongs all thanks',
      frenchText:
          'Ô Allah ! Tout bienfait qui m’arrive à moi ou à l’une de Tes créatures en ce soir provient de Toi seul, sans associé. À Toi la louange et à Toi le remerciement',
      virtue: 'مَنْ قَالَهَا حِينَ يُمْسِي فَقَدْ أَدَّى شُكْرَ لَيْلَتِهِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ حِينَ يُمْسِي: اللَّهُمَّ مَا أَمْسَى بِي مِنْ نِعْمَةٍ، أَوْ بِأَحَدٍ مِنْ خَلْقِكَ فَمِنْكَ وَحْدَكَ لَا شَرِيكَ لَكَ، فَلَكَ الْحَمْدُ وَلَكَ الشُّكْرُ، فَقَدْ أَدَّى شُكْرَ لَيْلَتِهِ، وَمَنْ قَالَ مِثْلَ ذَلِكَ حِينَ يُصْبِحُ فَقَدْ أَدَّى شُكْرَ يَوْمِهِ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),
    Dhikr(
      id: 'evening_hasbi',
      category: DhikrCategory.evening,
      arabicText:
          'حَسْبِيَ اللَّهُ لَا إِلَهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
      frenchText:
          'Allah me suffit. Il n’y a de divinité que Lui. C’est en Lui que je place ma confiance et Il est le Seigneur du Trône Immense',
      englishText:
          'Allah is sufficient for me. None has the right to be worshipped except Him. In Him I put my trust and He is the Lord of the Mighty Throne',
      virtue:
          'كِفَايَةٌ مِنَ اللَّهِ لِكُلِّ مَا أَهَمَّ الْعَبْدَ فِي الدُّنْيَا وَالْآخِرَةِ.',
      sourceText:
          'مَنْ قَالَهَا حِينَ يُمْسِي سَبْعَ مَرَّاتٍ كَفَاهُ اللَّهُ مَا أَهَمَّهُ.',
      sourceRef: 'رواه ابن السني',
      repetitions: 7,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_aafiyah_2',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ، اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ: فِي دِينِي وَدُنْيَايَ وَأَهْلِي، وَمَالِي، اللَّهُمَّ اسْتُرْ عَوْرَاتِي، وَآمِنْ رَوْعَاتِي، اللَّهُمَّ احْفَظْنِي مِنْ بَيْنِ يَدَيَّ، وَمِنْ خَلْفِي، وَعَنْ يَمِينِي، وَعَنْ شِمَالِي، وَمِنْ فَوْقِي، وَأَعُوذُ بِعَظَمَتِكَ أَنْ أُغْتَالَ مِنْ تَحْتِي',
      frenchText:
          'Ô Allah ! Je Te demande le pardon et le salut dans ma religion, ma vie ici-bas, ma famille et mes biens. Ô Allah ! Cache mes défauts et apaise mes craintes. Ô Allah ! Protège-me par devant, par derrière, sur ma droite, sur ma gauche et au-dessus de moi. Et je me réfugie auprès de Ta grandeur contre le fait d’être englouti par-dessous moi',
      englishText:
          'O Allah, I ask You for pardon and well-being in this world and the next. O Allah, I ask You for pardon and well-being in my religion and my worldly affairs, and in my family and my property. O Allah, conceal my faults and soothe my fears. O Allah, guard me from the front and from behind, from my right and from my left, and from above me, and I seek refuge in Your Greatness lest I be swallowed up from beneath me',
      virtue:
          'تَحْصِينٌ شَامِلٌ لِلنَّفْسِ وَالْأَهْلِ وَالْمَالِ مِنْ كُلِّ سُوءٍ.',
      sourceText:
          'عَنِ ابْنِ عُمَرَ رَضِيَ اللَّهُ عَنْهُمَا قَالَ: لَمْ يَكُنْ رَسُولُ اللَّهِ ﷺ يَدَعُ هَؤُلَاءِ الدَّعَوَاتِ حِينَ يُمْسِي وَحِينَ يُصْبِحُ: "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ...".',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),
    Dhikr(
      id: 'evening_afiyah',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ عَافِنِي فِي بَدَنِي، اللَّهُمَّ عَافِنِي فِي سَمْعِي، اللَّهُمَّ عَافِنِي فِي بَصَرِي، لَا إِلَهَ إِلَّا أَنْتَ. اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْكُفْرِ، وَالْفَقْرِ، وَأَعُوذُ بِكَ مِنْ عَذَابِ الْقَبْرِ، لَا إِلَهَ إِلَّا أَنْتَ',
      frenchText:
          'Ô Allah ! Préserve ma santé dans mon corps, mon ouïe et ma vue. Il n’y a de divinité que Toi. Ô Allah ! Je me réfugie auprès de Toi contre la mécréance et la pauvreté, et je me réfugie auprès de Toi contre le châtiment de la tombe. Il n’y a de divinité que Toi',
      englishText:
          'O Allah, make me healthy in my body, my hearing and my sight. None has the right to be worshipped except You. O Allah, I seek refuge in You from disbelief and poverty, and I seek refuge in You from the torment of the grave. None has the right to be worshipped except You',
      virtue:
          'طَلَبُ الْعَافِيَةِ وَالْوِقَايَةِ مِنَ الْفَقْرِ وَعَذَابِ الْقَبْرِ.',
      sourceText:
          'عَنْ عَبْدِ الرَّحْمَنِ بْنِ أَبِي بَكْرَةَ قَالَ لِأَبِيهِ: يَا أَبَتِ إِنِّي أَسْمَعُكَ تَدْعُو كُلَّ مَسَاءٍ: اللَّهُمَّ عَافِنِي فِي بَدَنِي... .',
      sourceRef: 'رواه أبو داود',
      repetitions: 3,
    ),
    Dhikr(
      id: 'evening_bismillah',
      category: DhikrCategory.evening,
      arabicText:
          'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهو السَّمِيعُ الْعَلِيمُ',
      englishText:
          'In the Name of Allah, Who with His Name nothing can cause harm in the earth nor in the heavens, and He is the All-Hearing, the All-Knowing',
      frenchText:
          'Au nom d’Allah, tel qu’en compagnie de Son Nom rien ne peut nuire sur terre ni dans le ciel, et Il est l’Audient, l’Omniscient',
      virtue:
          'حِمَايَةٌ إِلَهِيَّةٌ مِنْ كُلِّ مَكْرُوهٍ وَسُوءٍ فِي اللَّيْلِ.',
      sourceText:
          'عَنْ عُثْمَانَ بْنِ عَفَّانَ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ رَسُولُ اللَّهِ ﷺ: "مَا مِنْ عَبْدٍ يَقُولُ فِي صَبَاحِ كُلِّ يَوْمٍ وَمَسَاءِ كُلِّ لَيْلَةٍ: بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ ثَلَاثَ مَرَّاتٍ لَمْ يَضُرَّهُ شَيْءٌ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_raditu',
      category: DhikrCategory.evening,
      arabicText:
          'رَضِيتُ بِاللَّهِ رَبَّاً، وَبِالْإِسْلَامِ دِيناً، وَبِمُحَمَّدٍ ﷺ نَبِيَّاً',
      englishText:
          'I am pleased with Allah as my Lord, with Islam as my religion and with Muhammad (peace and blessings of Allah be upon him) as my Prophet',
      frenchText:
          'J’ai agréé Allah comme Seigneur, l’Islam comme religion et Muhammad (salut et bénédictions d’Allah sur lui) comme Prophète',
      virtue:
          'وَعْدٌ نَبَوِيٌّ لِمَنْ قَالَهُ بِالرِّضَا وَالْبُشْرَى يَوْمَ الْقِيَامَةِ.',
      sourceText:
          'عَنْ أَبِي سَعِيدٍ الْخُدْرِيِّ رَضِيَ اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ ﷺ قَالَ: "مَنْ قَالَ: رَضِيتُ بِاللَّهِ رَبًّا، وَبِالْإِسْلَامِ دِينًا، وَبِمُحَمَّدٍ نَبِيًّا، ثَلَاثَ مَرَّاتٍ حِينَ يُصْبِحُ، وَثَلَاثَ مَرَّاتٍ حِينَ يُمْسِي، كَانَ حَقًّا عَلَى اللَّهِ أَنْ يُرْضِيَهُ يَوْمَ الْقِيَامَةِ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_auzu',
      category: DhikrCategory.evening,
      arabicText:
          'أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ',
      englishText:
          'I take refuge in Allah’s perfect words from the evil that He has created',
      frenchText:
          'Je cherche protection auprès des paroles parfaites d’Allah contre le mal des êtres qu’Il a créés',
      virtue:
          'حِفْظٌ مِنَ اللَّدَغَاتِ وَالْحَشَرَاتِ وَالْأَذَى فِي اللَّيْلِ وَمَنْ نَزَلَ مَنْزِلاً.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ قَالَ: جَاءَ رَجُلٌ إِلَى النَّبِيِّ ﷺ فَقَالَ: يَا رَسُولَ اللَّهِ مَا لَقِيتُ مِنْ عَقْرَبٍ لَدَغَتْنِي الْبَارِحَةَ، قَالَ: "أَمَا لَوْ قُلْتَ حِينَ أَمْسَيْتَ: أَعُوذُ بِكَلِمَاتِ اللَّهِ التَّامَّاتِ مِنْ شَرِّ مَا خَلَقَ، لَمْ تَضُرَّكَ".',
      sourceRef: 'رواه مسلم',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'evening_ya_hayyu',
      category: DhikrCategory.evening,
      arabicText:
          'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ',
      frenchText:
          'Ô Vivant ! Ô Celui qui subsiste par Lui-même ! C’est par Ta miséricorde que j’appelle au secours. Améliore ma situation entière et ne me laisse pas à mon propre sort, ne serait-ce que le temps d’un clin d’œil',
      englishText:
          'O Ever Living, O Self-Subsisting, by Your mercy I seek help. Amend for me all my affairs and do not leave me to myself even for the blinking of an eye',
      virtue:
          'وَصِيَّةٌ نَبَوِيَّةٌ لِلِاسْتِغَاثَةِ بِأَسْمَاءِ اللَّهِ الْعُظْمَى لِكِفَايَةِ الْهَمِّ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ لِفَاطِمَةَ رَضِيَ اللَّهُ عَنْهَا: "مَا يَمْنَعُكِ أَنْ تَسْمَعِي مَا أُوصِيكِ بِهِ، أَوْ تَقُولِي إِذَا أَصْبَحْتِ وَإِذَا أَمْسَيْتِ: يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ، أَصْلِحْ لِي شَأْنِي كُلَّهُ، وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ".',
      sourceRef: 'رواه النسائي',
      repetitions: 3,
    ),
    Dhikr(
      id: 'evening_abu_bakr',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ عَالِمَ الْغَيْبِ وَالشَّهَادَةِ، فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ، رَبَّ كُلِّ شَيْءٍ وَمَلِيكَهُ، أَشْهَدُ أَنْ لَا إِلَهَ إِلَّا أَنْتَ، أَعُوذُ بِكَ مِنْ شَرِّ نَفْسِي، وَمِنْ شَرِّ الشَّيْطَانِ وَشِرْكِهِ، وَأَنْ أَقْتَرِفَ عَلَى نَفْسِي سُوءًا، أَوْ أَجُرَّهُ إِلَى مُسْلِمٍ',
      englishText:
          "O Allah, Knower of the unseen and the seen, Creator of the heavens and the earth, Lord and Sovereign of all things. I bear witness that none has the right to be worshipped except You. I seek refuge in You from the evil of my soul and from the evil and shirk of the devil, and from committing any wrong against myself or bringing it upon another Muslim",
      frenchText:
          "Ô Allah ! Toi qui connais l'Inconnu et le Témoigné, Créateur des cieux et de la terre, Seigneur et Souverain de toute chose. Je témoigne qu'il n'y a de divinité que Toi. Je me réfugie auprès de Toi contre le mal de mon âme, contre le mal de Satan et de son polythéisme, et contre le fait de me faire du mal à moi-même ou d'en faire à un autre musulman",
      virtue:
          'يُقَالُ فِي الصَّبَاحِ وَالْمَسَاءِ وَعِنْدَ النَّوْمِ لِلْحِفْظِ مِنَ الشُّرُورِ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ أَنَّ أَبَا بَكْرٍ الصِّدِّيقَ قَالَ: يَا رَسُولَ اللَّهِ، مُرْنِي بِكَلِمَاتٍ أَقُولُهُنَّ إِذَا أَصْبَحْتُ وَإِذَا أَمْسَيْتُ...',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'evening_fitra',
      category: DhikrCategory.evening,
      arabicText:
          'أَمْسَيْنَا عَلَى فِطْرَةِ الْإِخْلَاصِ، وَعَلَى مِلَّةِ أَبِينَا إِبْرَاهِيمَ حَنِيفًا مُسْلِمًا، وَمَا كَانَ مِنَ الْمُشْرِكِينَ',
      englishText:
          "We have entered the evening upon the natural religion of Islam, the word of sincere devotion, the religion of our Prophet Muhammad (peace and blessings of Allah be upon him), and the faith of our father Ibrahim, a man of pure belief and a Muslim, and he was not of those who worship others besides Allah",
      frenchText:
          "Nous voici au soir, sur la saine nature de l'Islam, sur la parole du dévouement sincère, sur la religion de notre Prophète Muhammad (salut et bénédictions d'Allah sur lui) et sur la confession de notre père Ibrahim, qui était un pur monothéiste, soumis à Allah, et n'était point du nombre des associateurs",
      virtue:
          'تَدْجِيدُ الْعَهْدِ مَعَ اللَّهِ عَلَى الْفِطْرَةِ وَالتَّوْحِيدِ وَالِاتِّبَاعِ.',
      sourceText:
          'عَنْ عَبْدِ الرَّحْمَنِ بْنِ أَبْزَى رَضِيَ اللَّهُ عَنْهُ عَنِ النَّبِيِّ ﷺ كَانَ يَقُولُ إِذَا أَمْسَى: "أَمْسَيْنَا عَلَى فِطْرَةِ الْإِسْلَامِ...".',
      sourceRef: 'رواه أحمد والترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'evening_istighfar_grand',
      category: DhikrCategory.evening,
      arabicText:
          'أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيَّ الْقَيُّومَ وَأَتُوبُ إِلَيْهِ',
      englishText:
          "I seek the forgiveness of Allah the Mighty, whom there is none worthy of worship except Him, the Living, the Eternal, and I repent to Him",
      frenchText:
          "Je demande pardon à Allah l'Immense, en dehors duquel il n'y a pas d'autre divinité, le Vivant, Celui qui subsiste par Lui-même, et je me repens à Lui",
      virtue: 'مَنْ قَالَهَا غُفِرَ لَهُ وَإِنْ كَانَ فَرَّ مِنَ الزَّحْفِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ: أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيَّ الْقَيُّومَ وَأَتُوبُ إِلَيْهِ، غُفِرَ لَهُ وَإِنْ كَانَ فَرَّ مِنَ الزَّحْفِ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 3,
    ),
    Dhikr(
      id: 'evening_shirk_protection',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ شَيْئًا أَعْلَمُهُ، وَأَسْتَغْفِرُكَ لِمَا لَا أَعْلَمُهُ',
      frenchText:
          'Ô Allah ! Je cherche protection auprès de Toi contre le fait de T’associer quoi que ce soit alors que je le sais, et je Te demande pardon pour ce que je ne sais pas',
      englishText:
          'O Allah, I seek refuge in You lest I should associate anything with You while I know it, and I seek Your forgiveness for what I do not know',
      virtue: 'حماية من الشرك الأصغر والخفي، ويذهب عنك كبير الشرك وصغيره.',
      sourceText:
          'قَالَ ﷺ: "أَلَا أَدُلُّكَ عَلَى شَيْءٍ إِذَا قُلْتَهُ ذَهَبَ عَنْكَ قَلِيلُ الشِّرْكِ وَكَثِيرُهُ؟ قُلْ: اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أُشْرِكَ بِكَ شَيْئاً أَعْلَمُهُ وَأَسْتَغْفِرُكَ لِمَا لَا أَعْلَمُهُ".',
      sourceRef: 'رواه أحمد',
      repetitions: 3,
    ),
    Dhikr(
      id: 'evening_hamm_hazan',
      category: DhikrCategory.evening,
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ، وَغَلَبَةِ الرِّجَالِ',
      frenchText:
          'Ô Allah ! Je me protège auprès de Toi contre l’anxiété et la tristesse, l’incapacité et la paresse, l’avarice et la lâcheté, le poids de la dette et la domination des hommes',
      englishText:
          'O Allah, I seek refuge in You from anxiety and sorrow, weakness and laziness, miserliness and cowardice, the burden of debts and from being overpowered by men',
      virtue:
          'اسْتِعَاذَةٌ شَامِلَةٌ مِنْ آفَاتِ الْقُلُوبِ وَالْأَبْدَانِ وَالدُّيُونِ.',
      sourceText:
          'عَنْ أَنَسِ بْنِ مَالِكٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ النَّبِيُّ ﷺ يُكْثِرُ أَنْ يَقُولَ: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحُزْنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ، وَغَلَبَةِ الرِّجَالِ".',
      sourceRef: 'رواه البخاري',
      repetitions: 3,
    ),
    Dhikr(
      id: 'evening_salat_alanabi',
      category: DhikrCategory.evening,
      arabicText: 'اللَّهُمَّ صَلِّ وَسَلِّمْ عَلَى نَبِيِّنَا مُحَمَّدٍ',
      englishText: 'O Allah, send prayers and peace upon our Prophet Muhammad',
      frenchText: 'Ô Allah, prie sur notre Prophète Muhammad',
      virtue:
          'شَفَاعَةُ النَّبِيِّ ﷺ يَوْمَ الْقِيَامَةِ لِمَنْ صَلَّى عَلَيْهِ عَشْراً.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ صَلَّى عَلَيَّ حِينَ يُصْبِحُ عَشْراً، وَحِينَ يُمْسِي عَشْراً، أَدْرَكَتْهُ شَفَاعَتِي يَوْمَ الْقِيَامَةِ".',
      sourceRef: 'رواه الطبراني',
      repetitions: 10,
    ),
    Dhikr(
      id: 'evening_tahlil_100',
      category: DhikrCategory.evening,
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
      englishText:
          'None has the right to be worshipped except Allah, alone, without partner. To Him belongs all sovereignty and praise and He is over all things omnipotent',
      frenchText:
          'Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose',
      virtue: 'فَضْلٌ عَظِيمٌ وَحِمَايَةٌ مِنَ الشَّيْطَانِ طِوَالَ اللَّيْلِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، فِي يَوْمٍ مِائَةَ مَرَّةٍ كَانَتْ لَهُ عَدْلَ عَشْرِ رِقَابٍ وَكُتِبَتْ لَهُ مِائَةُ حَسَنَةٍ وَمُحِيَتْ عَنْهُ مِائَةُ سَيِّئَةٍ".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 10,
    ),
    Dhikr(
      id: 'evening_tasbih_100',
      category: DhikrCategory.evening,
      arabicText: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
      englishText: 'Glory is to Allah',
      frenchText: 'Gloire et louange à Allah',
      virtue:
          'مَنْ قَالَهَا مِائَةَ مَرَّةٍ لَمْ يَأْتِ أَحَدٌ يَوْمَ الْقِيَامَةِ بِأَفْضَلَ مِمَّا جَاءَ بِهِ إِلَّا مَنْ قَالَ مِثْلَ ذَلِكَ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَالَ: سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، فِي يَوْمٍ مِائَةَ مَرَّةٍ، حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 100,
    ),

    // --- أذكار الاستيقاظ ---
    Dhikr(
      id: 'waking_1',
      category: DhikrCategory.wakingUp,
      arabicText:
          'الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ',
      englishText:
          'Praise is to Allah who gives us life after He has caused us to die and to Him is the resurrection',
      frenchText:
          'Louange à Allah qui nous a rendu la vie après nous avoir fait mourir, et c\'est vers Lui que se fera le retour',
      virtue:
          'شُكْرٌ لِلَّهِ عَلَى حَيَاةٍ جَدِيدَةٍ، وَاعْتِرَافٌ بِفَضْلِهِ فِي اسْتِعَادَةِ الرُّوحِ.',
      sourceText:
          'عَنْ حُذَيْفَةَ بْنِ الْيَمَانِ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ النَّبِيُّ ﷺ إِذَا أَرَادَ أَنْ يَنَامَ قَالَ: "بِاسْمِكَ اللَّهُمَّ أَمُوتُ وَأَحْيَا"، وَإِذَا اسْتَيْقَظَ قَالَ: "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'waking_2',
      category: DhikrCategory.wakingUp,
      arabicText:
          'الْحَمْدُ لِلَّهِ الَّذِي عَافَانِي فِي جَسَدِي، وَرَدَّ عَلَيَّ رُوحِي، وَأَذِنَ لِي بِذِكْرِهِ',
      englishText:
          'Praise is to Allah Who has given my body health, and restored my soul to me, and permitted me to remember Him',
      frenchText:
          'Louange à Allah qui m\'a rendu la santé, m\'a restitué mon âme et m\'a permis de L\'évoquer',
      virtue:
          'شُكْرُ اللَّهِ عَلَى الْعَافِيَةِ الْبَدَنِيَّةِ وَالرُّوحِيَّةِ، وَحِفْظٌ لِلصِّحَّةِ النَّفْسِيَّةِ وَالْجَسَدِيَّةِ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ عَنِ النَّبِيُّ ﷺ قَالَ: "إِذَا اسْتَيْقَظَ أَحَدُكُمْ فَلْيَقُلْ: الْحَمْدُ لِلَّهِ الَّذِي عَافَانِي فِي جَسَدِي، وَرَدَّ عَلَيَّ رُوحِي، وَأَذِنَ لِي بِذِكْرِهِ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),

    // --- أذكار النوم ---
    // --- أذكار النوم ---
    Dhikr(
      id: 'sleep_ikhlas',
      category: DhikrCategory.sleep,
      arabicText:
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nقُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
      englishText:
          'Say: He is Allah, the One and Only. Allah, the Eternal, Absolute; He begetteth not, nor is He begotten; And there is none like unto Him',
      frenchText:
          'Dis : "Il est Allah, Unique. Allah, Le Seul à être imploré pour ce que nous désirons. Il n’a jamais engendré, n’a pas été engendré non plus. Et nul n’est égal à Lui"',
      virtue:
          'سُنَّةٌ نَبَوِيَّةٌ عِنْدَ النَّوْمِ لِلتَّحْصِينِ وَالْبَرَكَةِ، يَجْمَعُ كَفَّيْهِ وَيَنْفُثُ فِيهِمَا ثُمَّ يَمْسَحُ جَسَدَهُ.',
      sourceText:
          'كَانَ النَّبِيُّ ﷺ إِذَا أَوَى إِلَى فِرَاشِهِ كُلَّ لَيْلَةٍ جَمَعَ كَفَّيْهِ ثُمَّ نَفَثَ فِيهِمَا فَقَرَأَ الْإِخْلَاصَ وَالْمُعَوِّذَتَيْنِ.',
      sourceRef: 'رواه البخاري',
      repetitions: 3,
    ),
    Dhikr(
      id: 'sleep_falaq',
      category: DhikrCategory.sleep,
      arabicText:
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ الْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
      englishText:
          'Say: I seek refuge with the Lord of the Dawn. From the mischief of created things; From the mischief of Darkness as it overspreads; From the mischief of those who blow on knots; And from the mischief of the envious one as he practises envy',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur de l’aube naissante, contre le mal des êtres qu’Il a créés, contre le mal de l’obscurité quand elle s’approfondit, contre le mal de celles qui soufflent [les sorcières] sur les nœuds, et contre le mal de l’envieux quand il envie"',
      virtue: 'تَحْصِينٌ مِنْ شُرُورِ الْمَخْلُوقَاتِ وَالسِّحْرِ وَالْحَسَدِ.',
      sourceText:
          'عَنْ عَائِشَةَ رَضِيَ اللَّهُ عَنْهَا أَنَّ النَّبِيَّ ﷺ كَانَ إِذَا أَوَى إِلَى فِرَاشِهِ كُلَّ لَيْلَةٍ، جَمَعَ كَفَّيْهِ ثُمَّ نَفَثَ فِيهِمَا فَقَرَأَ فِيهِمَا: {قُلْ هُوَ اللَّهُ أَحَدٌ}، وَ {قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ}، وَ {قُلْ أَعُوذُ بِرَبِّ النَّاسِ}، ثُمَّ يَمْسَحُ بِهِمَا مَا اسْتَطَاعَ مِنْ جَسَدِهِ.',
      sourceRef: 'رواه البخاري',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'sleep_nas',
      category: DhikrCategory.sleep,
      arabicText:
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَهِ النَّاسِ، مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَالنَّاسِ',
      englishText:
          'Say: I seek refuge with the Lord of Mankind, the King of Mankind, the God of Mankind, from the mischief of the Whisperer (of Evil), who withdraws (after his whisper), (the same) who whispers into the hearts of Mankind, among Jinns and among men',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur des hommes. Le Souverain des hommes, Dieu des hommes, contre le mal du mauvais conseiller furtif, qui souffle le mal dans les poitrines des hommes, qu’il [le conseiller] soit un djinn, ou un être humain"',
      virtue: 'تَحْصِينٌ مِنْ وَسْوَاسِ الشَّيْطَانِ وَالْجِنِّ.',
      sourceText:
          'عَنْ عَائِشَةَ رَضِيَ اللَّهُ عَنْهَا أَنَّ النَّبِيَّ ﷺ كَانَ إِذَا أَوَى إِلَى فِرَاشِهِ كُلَّ لَيْلَةٍ، جَمَعَ كَفَّيْهِ ثُمَّ نَفَثَ فِيهِمَا فَقَرَأَ فِيهِمَا: {قُلْ هُوَ اللَّهُ أَحَدٌ}، وَ {قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ}، وَ {قُلْ أَعُوذُ بِرَبِّ النَّاسِ}، ثُمَّ يَمْسَحُ بِهِمَا مَا اسْتَطَاعَ مِنْ جَسَدِهِ.',
      sourceRef: 'رواه البخاري',
      repetitions: 3,
      isEssential: true,
    ),
    Dhikr(
      id: 'sleep_kursi',
      category: DhikrCategory.sleep,
      arabicText:
          'أَعُوذُ بِاللَّهِ مِنَ الشَّيطَانِ الرَّجِيمِ\nاللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهو الْعَلِيُّ الْعَظِيمُ',
      englishText:
          'Allah! There is no god but He, the Living, the Self-subsisting, Eternal. No slumber can seize Him nor sleep. His are all things in the heavens and on earth. Who is there can intercede in His presence except as He permitteth? He knoweth what (appeareth to His creatures as) before or after or behind them, nor shall they compass aught of His knowledge except as He willeth. His Throne doth extend over the heavens and the earth, and He feeleth no fatigue in guarding and preserving them for He is the Most High, the Supreme (in glory)',
      frenchText:
          'Allah ! Point de divinité à part Lui, le Vivant, Celui qui subsiste par Lui-même "Al-Qayyûm". Ni somnolence ni sommeil ne Le saisissent. À Lui appartient tout ce qui est dans les cieux et sur la terre. Qui peut intercéder auprès de Lui sans Sa permission ? Il connaît leur passé et leur futur. Et, de Sa science, ils n’embrassent que ce qu’Il veut. Son Trône "Kursî" déborde les cieux et la terre, dont la garde ne Lui coûte aucune peine. Et Il est le Très Haut, l’Immense',
      virtue:
          'مَنْ قَرَأَهَا إِذَا أَوَى إِلَى فِرَاشِهِ لَمْ يَزَلْ عَلَيْهِ مِنَ اللَّهِ حَافِظٌ وَلَا يَقْرَبُهُ شَيْطَانٌ حَتَّى يُصْبِحَ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ أَنَّ النَّبِيَّ ﷺ قَالَ: "إِذَا أَوَيْتَ إِلَى فِرَاشِكَ فَاقْرَأْ آيَةَ الْكُرْسِيِّ فَإِنَّهُ لَا يَزَالُ عَلَيْكَ مِنَ اللَّهِ حَافِظٌ وَلَا يَقْرَبُكَ شَيْطَانٌ حَتَّى تُصْبِحَ".',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'sleep_aslamtu',
      category: DhikrCategory.sleep,
      arabicText:
          'اللَّهُمَّ أَسْلَمْتُ نَفْسِي إِلَيْكَ، وَفَوَّضْتُ أَمْرِي إِلَيْكَ، وَوَجَّهْتُ وَجْهِي إِلَيْكَ، وَأَلْجَأْتُ ظَهْرِي إِلَيْكَ، رَغْبَةً وَرَهْبَةً إِلَيْكَ، لَا مَلْجَأَ وَلَا مَنْجَا مِنْكَ إِلَّا إِلَيْكَ، آمَنْتُ بِكِتَابِكَ الَّذِي أَنْزَلْتَ، وَبِنَبِيِّكَ الَّذِي أَرْسَلْتَ',
      englishText:
          'O Allah, I submit myself to You, entrust my affairs to You, turn my face to You, and lay myself down in reliance upon You, out of hope and fear of You. There is no refuge or escape from You except to You. I believe in Your Book which You have revealed and in Your Prophet whom You have sent',
      frenchText:
          'Ô Allah ! Je Te soumets mon âme, je Te confie mes affaires, je tourne mon visage vers Toi et je m’appuie sur Toi, par désir pour Toi et par crainte de Toi. Il n’y a de refuge ni de salut contre Toi qu’en Toi-même. Je crois au Livre que Tu as descendu et au Prophète que Tu as envoyé',
      virtue: 'مَنْ قَالَهَا وَمَاتَ مِنْ لَيْلَتِهِ كَانَ عَلَى الْفِطْرَةِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "إِذَا أَتَيْتَ مَضْجَعَكَ فَتَوَضَّأْ وُضُوءَكَ لِلصَّلَاةِ ثُمَّ اضْطَجِعْ عَلَى شِقِّكَ الْأَيْمَنِ وَقُلْ: اللَّهُمَّ أَسْلَمْتُ نَفْسِي إِلَيْكَ...".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'sleep_1',
      category: DhikrCategory.sleep,
      arabicText:
          'بِاسْمِكَ رَبِّي وَضَعْتُ جَنْبِي، وَبِكَ أَرْفَعُهُ، فَإِنْ أَمْسَكْتَ نَفْسِي فَارْحَمْهَا، وَإِنْ أَرْسَلْتَهَا فَاحْفَظْهَا بِمَا تَحْفَظُ بِهِ عِبَادَكَ الصَّالِحِينَ',
      englishText:
          'In Your name my Lord, I lie down and in Your name I rise. If You should take my soul then have mercy upon it, and if You should return my soul then protect it in the manner You do for Your righteous servants',
      frenchText:
          'C’est en Ton nom, Seigneur, que je pose mon côté et c’est en Ton nom que je me relève. Si Tu reprends mon âme, fais-lui miséricorde ; et si Tu me la rends, protège-la comme Tu protèges Tes serviteurs vertueux',
      virtue:
          'دُعَاءٌ لِلِاسْتِسْلَامِ لِلَّهِ فِي النَّوْمِ وَطَلَبُ الرَّحْمَةِ وَالْحِفْظِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "إِذَا قَامَ أَحَدُكُمْ مِنْ فِرَاشِهِ ثُمَّ رَجَعَ إِلَيْهِ فَلْيَنْفُضْهُ بِصَنِفَةِ إِزَارِهِ ثَلَاثَ مَرَّاتٍ، وَلَا يَدْرِي مَا خَلَفَهُ عَلَيْهِ بَعْدَهُ، فَإِذَا اضْطَجَعَ فَلْيَقُولُ: بِاسْمِكَ رَبِّي وَضَعْتُ جَنْبِي...".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'sleep_baqarah',
      category: DhikrCategory.sleep,
      arabicText: '''أَعُوذُ بِاللَّهِ مِنَ الشَّيطَانِ الرَّجِيمِ
آمَنَ الرَّسُولُ بِمَا أُنزِلَ إِلَيْهِ مِن رَّبِّهِ وَالْمُؤْمِنُونَ ۚ كُلٌّ آمَنَ بِاللَّهِ وَمَلَائِكَتِهِ وَكُتُبِهِ وَرُسُلِهِ لَا نُفَرِّقُ بَيْنَ أَحَدٍ مِّن رُّسُلِهِ ۚ وَقَالُوا سَمِعْنَا وَأَطَعْنَا ۖ غُفْرَانَكَ رَبَّنَا وَإِلَيْكَ الْمَصِيرُ. لَا يُكَلِّفُ اللَّهُ نَفْسًا إِلَّا وُسْعَهَا ۚ لَهَا مَا كَسَبَتْ وَعَلَيْهَا مَا اكْتَسَبَتْ ۗ رَبَّنَا لَا تُؤَاخِذْنَا إِن نَّسِينَا أَوْ أَخْطَأْنَا ۚ رَبَّنَا وَلَا تَحْمِلْ عَلَيْنَا إِصْرًا كَمَا حَمَلْتَهُ عَلَى الَّذِينَ مِن قَبْلِنَا ۚ رَبَّنَا وَلَا تُحَمِّلْنَا مَا لَا طَاقَةَ لَنَا بِهِ ۖ وَاعْفُ عَنَّا وَاغْفِرْ لَنَا وَارْحَمْنَا ۚ أَنتَ مَوْلَانَا فَانصُرْنَا عَلَى الْقَوْمِ الْكَافِرِينَ''',
      englishText:
          'The Messenger has believed in what was revealed to him from his Lord, and [so have] the believers. All of them have believed in Allah and His angels and His books and His messengers... Allah does not charge a soul except with that which is within its capacity. It will have [the consequence of] what [good] it has gained, and it will bear [the consequence of] what [evil] it has earned. "Our Lord, do not impose blame upon us if we have forgotten or erred. Our Lord, and lay not upon us a burden like that which You laid upon those before us. Our Lord, and burden us not with that which we have no ability to bear. And pardon us; and forgive us; and have mercy upon us. You are our protector, so give us victory over the disbelieving people."',
      frenchText:
          'Le Messager a cru en ce qui lui a été descendu de son Seigneur, et aussi les croyants : tous ont cru en Allah, en Ses Anges, à Ses Livres et en Ses Messagers... Allah n’impose à aucune âme une charge supérieure à sa capacité. Elle sera récompensée du bien qu’elle aura fait, et punie du mal qu’elle aura fait. "Seigneur, ne nous châtie pas s’il nous arrive d’oublier ou de commettre une erreur. Seigneur ! Ne nous charge pas d’un fardeau lourd comme Tu as chargé ceux qui vécurent avant nous. Seigneur ! Ne nous impose pas ce que nous ne pouvons supporter, efface nos fautes, pardonne-nous et fais-nous miséricorde. Tu es notre Maître, accorde-nous donc la victoire sur les peuples infidèles"',
      virtue: 'مَنْ قَرَأَهُمَا فِي لَيْلَةٍ كَفَتَاهُ.',
      sourceText:
          'عَنْ أَبِي مَسْعُودٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ النَّبِيُّ ﷺ: "مَنْ قَرَأَ بِالْآيَتَيْنِ مِنْ آخِرِ سُورَةِ الْبَقَرَةِ فِي لَيْلَةٍ كَفَتَاهُ".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
      isEssential: true,
    ),
    Dhikr(
      id: 'sleep_qini',
      category: DhikrCategory.sleep,
      arabicText: 'اللَّهُمَّ قِنِي عَذَابَكَ يَوْمَ تَبْعَثُ عِبَادَكَ',
      englishText:
          'O Allah, save me from Your punishment the Day You resurrect Your slaves',
      frenchText:
          'Ô Allah ! Préserve-moi de Ton châtiment le jour où Tu ressusciteras Tes serviteurs',
      virtue:
          'كَانَ النَّبِيُّ ﷺ يَضَعُ يَدَهُ الْيُمْنَى تَحْتَ خَدِّهِ وَيَقُولُهَا ثَلَاثاً.',
      sourceText:
          'عَنْ حُذَيْفَةَ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ النَّبِيُّ ﷺ إِذَا أَرَادَ أَنْ يَنَامَ وَضَعَ يَدَهُ الْيُمْنَى تَحْتَ خَدِّهِ، ثُمَّ قَالَ: "اللَّهُمَّ قِنِي عَذَابَكَ يَوْمَ تَبْعَثُ عِبَادَكَ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 3,
    ),
    Dhikr(
      id: 'sleep_tasbih_subhanallah',
      category: DhikrCategory.sleep,
      arabicText: 'سُبْحَانَ اللَّهِ',
      englishText: 'Glory is to Allah',
      frenchText: 'Gloire à Allah',
      virtue: 'خير لكما من خادم، يعطي قوة للبدن في اليوم التالي.',
      sourceText:
          'أن فاطمة رضي الله عنها أتت النبي ﷺ تسأله خادماً، فلم تجده، فذكرت ذلك لعائشة، فلما جاء أخبرته، قال علي: فجاءنا وقد أخذنا مضاجعنا، فقال: "ألا أدلكما على خير مما سألتما؟ إذا أويتما إلى فراشكما فسبحا ثلاثاً وثلاثين، واحمدا ثلاثاً وثلاثين، وكبرا أربعاً وثلاثين، فهو خير لكما من خادم".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 33,
    ),
    Dhikr(
      id: 'sleep_tasbih_alhamdulillah',
      category: DhikrCategory.sleep,
      arabicText: 'الْحَمْدُ لِلَّهِ',
      englishText: 'Praise is to Allah',
      frenchText: 'Louange à Allah',
      virtue: 'خير لكما من خادم، يعطي قوة للبدن في اليوم التالي.',
      sourceText:
          'أن فاطمة رضي الله عنها أتت النبي ﷺ تسأله خادماً، فلم تجده، فذكرت ذلك لعائشة، فلما جاء أخبرته، قال علي: فجاءنا وقد أخذنا مضاجعنا، فقال: "ألا أدلكما على خير مما سألتما؟ إذا أويتما إلى فراشكما فسبحا ثلاثاً وثلاثين، واحمدا ثلاثاً وثلاثين، وكبرا أربعاً وثلاثين، فهو خير لكما من خادم".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 33,
    ),
    Dhikr(
      id: 'sleep_tasbih_allahuakbar',
      category: DhikrCategory.sleep,
      arabicText: 'اللَّهُ أَكْبَرُ',
      englishText: 'Allah is the Greatest',
      frenchText: 'Allah est le plus Grand',
      virtue: 'خير لكما من خادم، يعطي قوة للبدن في اليوم التالي.',
      sourceText:
          'أن فاطمة رضي الله عنها أتت النبي ﷺ تسأله خادماً، فلم تجده، فذكرت ذلك لعائشة، فلما جاء أخبرته، قال علي: فجاءنا وقد أخذنا مضاجعنا، فقال: "ألا أدلكما على خير مما سألتما؟ إذا أويتما إلى فراشكما فسبحا ثلاثاً وثلاثين، واحمدا ثلاثاً وثلاثين، وكبرا أربعاً وثلاثين، فهو خير لكما من خادم".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 34,
    ),
    Dhikr(
      id: 'sleep_kafirun',
      category: DhikrCategory.sleep,
      arabicText:
          '''بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ\nقُلْ يَا أَيُّهَا الْكَافِرُونَ، لَا أَعْبُدُ مَا تَعْبُدُونَ، وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ، وَلَا أَنَا عَابِدٌ مَّا عَبَدتُّمْ، وَلَا أَنتُمْ عَابِدُونَ مَا أَعْبُدُ، لَكُمْ دِينُكُمْ وَلِيَ دِينِ''',
      englishText:
          'Say, "O disbelievers, I do not worship what you worship. Nor are you worshippers of what I worship. Nor will I be a worshipper of what you worship. Nor will you be worshippers of what I worship. For you is your religion, and for me is my religion."',
      frenchText:
          'Dis : "Ô vous les infidèles ! Je n’adore pas ce que vous adorez. Et vous n’êtes pas adorateurs de ce que j’adore. Et je ne suis pas adorateur de ce que vous avez adoré. Et vous n’êtes pas adorateurs de ce que j’adore. À vous votre religion, et à moi ma religion"',
      virtue: 'بَرَاءَةٌ مِنَ الشِّرْكِ لِمَنْ قَرَأَهَا قَبْلَ النَّوْمِ.',
      sourceText:
          'عَنْ فَرْوَةَ بْنِ نَوْفَلٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: "أَتَيْتُ النَّبِيَّ ﷺ فَقُلْتُ: يَا رَسُولَ اللَّهِ عَلِّمْنِي شَيْئاً أَقُولُهُ إِذَا أَوَيْتُ إِلَى فِرَاشِي، فَقَالَ: اقْرَأْ {قُلْ يَا أَيُّهَا الْكَافِرُونَ} فَإِنَّهَا بَرَاءَةٌ مِنَ الشِّرْكِ".',
      sourceRef: 'رواه أبو داود والترمذي',
      repetitions: 1,
    ),

    // --- أذكار بعد الصلاة ---
    Dhikr(
      id: 'prayer_1',
      category: DhikrCategory.afterPrayer,
      arabicText: 'أَسْتَغْفِرُ اللهَ',
      englishText: 'I ask Allah for forgiveness',
      frenchText: 'Je demande pardon à Allah',
      virtue: 'سُنَّةُ النَّبِيِّ ﷺ دُبُرَ كُلِّ صَلَاةٍ مَكْتُوبَةٍ.',
      sourceText:
          'عَنْ ثَوْبَانَ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ رَسُولُ اللَّهِ ﷺ إِذَا انْصَرَفَ مِنْ صَلَاتِهِ اسْتَغْفَرَ ثَلَاثاً، وَقَالَ: اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ.',
      sourceRef: 'رواه مسلم',
      repetitions: 3,
    ),
    Dhikr(
      id: 'prayer_2',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'اللَّهُمَّ أَنْتَ السَّلامُ وَمِنْكَ السَّلامُ، تَبَارَكْتَ يَا ذَا الْجَلالِ وَالإِكْرَامِ',
      englishText:
          'O Allah, You are Peace and from You comes peace. Blessed are You, O Owner of Majesty and Honor',
      frenchText:
          'Ô Allah ! Tu es la Paix et la paix vient de Toi. Béni sois-Tu, ô Détenteur de la Majesté et de la Générosité',
      virtue: 'ثَنَاءٌ عَلَى اللَّهِ بِصِفَةِ السَّلَامِ.',
      sourceText:
          'عَنْ ثَوْبَانَ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ رَسُولُ اللَّهِ ﷺ إِذَا انْصَرَفَ مِنْ صَلَاتِهِ اسْتَغْفَرَ ثَلَاثاً، وَقَالَ: "اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، تَبَارَكْتَ يَا ذَا الْجَلَالِ وَالْإِكْرَامِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'prayer_3',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، اللَّهُمَّ لَا مَانِعَ لِمَا أَعْطَيْتَ، وَلَا مُعْطِيَ لِمَا مَنَعْتَ، وَلَا يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ',
      englishText:
          'None has the right to be worshipped but Allah alone, Who has no partner, His is the dominion and His is the praise, and He is Able to do all things. O Allah, none can prevent what You have granted, nor can anyone grant what You have prevented, and no wealth or majesty can benefit anyone, as from You is all wealth and majesty',
      frenchText:
          'Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose. Ô Allah, nul ne peut retenir ce que Tu as donné et nul ne peut donner ce que Tu as retenu. La fortune des fortunés ne leur est d’aucune utilité auprès de Toi',
      virtue:
          'اعْتِرَافٌ بِتَوْحِيدِ اللَّهِ وَقُدْرَتِهِ الْمُطْلَقَةِ وَسَعَةِ عَطَائِهِ.',
      sourceText:
          'عَنِ الْمُغِيرَةِ بْنِ شُعْبَةَ رَضِيَ اللَّهُ عَنْهُ أَنَّ النَّبِيَّ ﷺ كَانَ يَقُولُ فِي دُبُرِ كُلِّ صَلَاةٍ مَكْتُوبَةٍ حِينَ يُسَلِّمُ: "لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، اللَّهُمَّ لَا مَانِعَ لِمَا أَعْطَيْتَ، وَلَا مُعْطِيَ لِمَا مَنَعْتَ، وَلَا يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ".',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'prayer_tasbih_subhanallah',
      category: DhikrCategory.afterPrayer,
      arabicText: 'سُبْحَانَ اللهِ',
      englishText: 'Glory is to Allah',
      frenchText: 'Gloire à Allah',
      virtue:
          'مَنْ سَبَّحَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ... غُفِرَتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ عَنْ رَسُولِ اللَّهِ ﷺ قَالَ: "مَنْ سَبَّحَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ، وَحَمِدَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، وَكَبَّرَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، فَتِلْكَ تِسْعَةٌ وَتِسْعُونَ، وَقَالَ تَمَامَ الْمِائَةِ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، غُفِرَتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 33,
    ),
    Dhikr(
      id: 'prayer_tasbih_alhamdulillah',
      category: DhikrCategory.afterPrayer,
      arabicText: 'الْحَمْدُ للهِ',
      englishText: 'Praise is to Allah',
      frenchText: 'Louange à Allah',
      virtue:
          'مَنْ حَمِدَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ... غُفِرَتْ خَطَايَاهُ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ عَنْ رَسُولِ اللَّهِ ﷺ قَالَ: "مَنْ سَبَّحَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ، وَحَمِدَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، وَكَبَّرَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، فَتِلْكَ تِسْعَةٌ وَتِسْعُونَ، وَقَالَ تَمَامَ الْمِائَةِ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، غُفِرَتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 33,
    ),
    Dhikr(
      id: 'prayer_tasbih_allahuakbar',
      category: DhikrCategory.afterPrayer,
      arabicText: 'اللهُ أَكْبَرُ',
      englishText: 'Allah is the Greatest',
      frenchText: 'Allah est le plus Grand',
      virtue:
          'مَنْ كَبَّرَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ... غُفِرَتْ خَطَايَاهُ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ عَنْ رَسُولِ اللَّهِ ﷺ قَالَ: "مَنْ سَبَّحَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ، وَحَمِدَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، وَكَبَّرَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، فَتِلْكَ تِسْعَةٌ وَتِسْعُونَ، وَقَالَ تَمَامَ الْمِائَةِ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، غُفِرَتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 33,
    ),
    Dhikr(
      id: 'prayer_tamam',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
      englishText:
          'None has the right to be worshipped but Allah alone, Who has no partner, His is the dominion and His is the praise, and He is Able to do all things',
      frenchText:
          'Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose',
      virtue:
          'تَكْمِلَةُ الْمِائَةِ بَعْدَ التَّسْبِيحِ وَالتَّحْمِيدِ وَالتَّكْبِيرِ، لِتُغْفَرَ الْخَطَايَا وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ.',
      sourceText:
          'عَنْ أَبِي هُرَيْرَةَ رَضِيَ اللَّهُ عَنْهُ عَنْ رَسُولِ اللَّهِ ﷺ قَالَ: "مَنْ سَبَّحَ اللَّهَ فِي دُبُرِ كُلِّ صَلَاةٍ ثَلَاثاً وَثَلَاثِينَ، وَحَمِدَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، وَكَبَّرَ اللَّهَ ثَلَاثاً وَثَلَاثِينَ، فَتِلْكَ تِسْعَةٌ وَتِسْعُونَ، وَقَالَ تَمَامَ الْمِائَةِ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، غُفِرَتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'prayer_tahlil_fajr_maghrib',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيتُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
      englishText:
          'None has the right to be worshipped but Allah alone, Who has no partner, His is the dominion and His is the praise. He gives life and causes death, and He is Able to do all things',
      frenchText:
          'Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange. Il donne la vie et donne la mort, et Il est Capable de toute chose',
      virtue:
          'مَنْ قَالَهَا بَعْدَ صَلَاةِ الْفَجْرِ وَالْمَغْرِبِ عَشْرَ مَرَّاتٍ كَانَتْ لَهُ غِرَاساً فِي الْجَنَّةِ وَحِرْزاً مِنْ كُلِّ سُوءٍ.',
      sourceText:
          'عَنْ أَبِي ذَرٍّ رَضِيَ اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ ﷺ قَالَ: "مَنْ قَالَ فِي دُبُرِ صَلَاةِ الْفَجْرِ، وَهُوَ ثَانٍ رِجْلَيْهِ، قَبْلَ أَنْ يَتَكَلَّمَ: لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيتُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ، عَشْرَ مَرَّاتٍ، كَتَبَ اللَّهُ لَهُ عَشْرَ حَسَنَاتٍ، وَمَحَا عَنْهُ عَشْرَ سَيِّئَاتٍ، وَرَفَعَ لَهُ عَشْرَ دَرَجَاتٍ، وَكَانَ يَوْمُهُ ذَلِكَ كُلُّهُ فِي حِرْزٍ مِنْ كُلِّ مَكْرُوهٍ، وَحَرَسٍ مِنَ الشَّيْطَانِ، وَلَمْ يَنْبَغِ لِذَنْبٍ أَنْ يُدْرِكَهُ فِي ذَلِكَ الْيَوْمِ إِلَّا الشِّرْكَ بِاللَّهِ".',
      sourceRef: 'رواه الترمذي',
      repetitions: 10,
    ),
    Dhikr(
      id: 'prayer_kursi',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'اللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ وَلَا يَئُودُهُ حِفْظُهُمَا وَهو الْعَلِيُّ الْعَظِيمُ',
      englishText:
          'Allah! There is no god but He, the Living, the Self-subsisting, Eternal. No slumber can seize Him nor sleep. His are all things in the heavens and on earth. Who is there can intercede in His presence except as He permitteth? He knoweth what (appeareth to His creatures as) before or after or behind them, nor shall they compass aught of His knowledge except as He willeth. His Throne doth extend over the heavens and the earth, and He feeleth no fatigue in guarding and preserving them for He is the Most High, the Supreme (in glory)',
      frenchText:
          'Allah ! Point de divinité à part Lui, le Vivant, Celui qui subsiste par Lui-même "Al-Qayyûm". Ni somnolence ni sommeil ne Le saisissent. À Lui appartient tout ce qui est dans les cieux et sur la terre. Qui peut intercéder auprès de Lui sans Sa permission ? Il connaît leur passé et leur futur. Et, de Sa science, ils n’embrassent que ce qu’Il veut. Son Trône "Kursî" déborde les cieux et la terre, dont la garde ne Lui coûte aucune peine. Et Il est le Très Haut, l’Immense',
      virtue:
          'مَنْ قَرَأَهَا دُبُرَ كُلِّ صَلَاةٍ لَمْ يَمْنَعْهُ مِنْ دُخُولِ الْجَنَّةِ إِلَّا أَنْ يَمُوتَ.',
      sourceText:
          'عَنْ أَبِي أُمَامَةَ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ رَسُولُ اللَّهِ ﷺ: "مَنْ قَرَأَ آيَةَ الْكُرْسِيِّ دُبُرَ كُلِّ صَلَاةٍ مَكْتُوبَةٍ لَمْ يَمْنَعْهُ مِنْ دُخُولِ الْجَنَّةِ إِلَّا أَنْ يَمُوتَ".',
      sourceRef: 'رواه النسائي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'prayer_ikhlas',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nقُلْ هُوَ اللَّهُ أَحَدٌ، اللَّهُ الصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُ كُفُوًا أَحَدٌ',
      englishText:
          'Say: He is Allah, the One and Only. Allah, the Eternal, Absolute; He begetteth not, nor is He begotten; And there is none like unto Him',
      frenchText:
          'Dis : "Il est Allah, Unique. Allah, Le Seul à être imploré pour ce que nous désirons. Il n’a jamais engendré, n’a pas été engendré non plus. Et nul n’est égal à Lui"',
      virtue:
          'سُنَّةٌ دُبُرَ كُلِّ صَلَاةٍ فِي الْأَوْقَاتِ الْعَادِيَّةِ، وَتُكَرَّرُ ثَلَاثاً فِي الصُّبْحِ وَالْمَغْرِبِ.',
      sourceText:
          'عَنْ عُقْبَةَ بْنِ عَامِرٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: "أَمَرَنِي رَسُولُ اللَّهِ ﷺ أَنْ أَقْرَأَ بِالْمُعَوِّذَاتِ دُبُرَ كُلِّ صَلَاةٍ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),
    Dhikr(
      id: 'prayer_falaq',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ الْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ النَّفَّاثَاتِ فِي الْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ',
      englishText:
          'Say: I seek refuge with the Lord of the Dawn. From the mischief of created things; From the mischief of Darkness as it overspreads; From the mischief of those who blow on knots; And from the mischief of the envious one as he practises envy',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur de l’aube naissante, contre le mal des êtres qu’Il a créés, contre le mal de l’obscurité quand elle s’approfondit, contre le mal de celles qui soufflent [les sorcières] sur les nœuds, et contre le mal de l’envieux quand il envie"',
      virtue:
          'سُنَّةٌ دُبُرَ كُلِّ صَلَاةٍ فِي الْأَوْقَاتِ الْعَادِيَّةِ، وَتُكَرَّرُ ثَلَاثاً فِي الصُّبْحِ وَالْمَغْرِبِ.',
      sourceText:
          'عَنْ عُقْبَةَ بْنِ عَامِرٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: "أَمَرَنِي رَسُولُ اللَّهِ ﷺ أَنْ أَقْرَأَ بِالْمُعَوِّذَاتِ دُبُرَ كُلِّ صَلَاةٍ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),
    Dhikr(
      id: 'prayer_nas',
      category: DhikrCategory.afterPrayer,
      arabicText:
          'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ\nقُلْ أَعُوذُ بِرَبِّ النَّاسِ، مَلِكِ النَّاسِ، إِلَهِ النَّاسِ، مِن شَرِّ الْوَسْوَاسِ الْخَنَّاسِ، الَّذِي يُوَسْوِسُ فِي صُدُورِ النَّاسِ، مِنَ الْجِنَّةِ وَالنَّاسِ',
      englishText:
          'Say: I seek refuge with the Lord of Mankind, the King of Mankind, the God of Mankind, from the mischief of the Whisperer (of Evil), who withdraws (after his whisper), (the same) who whispers into the hearts of Mankind, among Jinns and among men',
      frenchText:
          'Dis : "Je cherche protection auprès du Seigneur des hommes. Le Souverain des hommes, Dieu des hommes, contre le mal du mauvais conseiller furtif, qui souffle le mal dans les poitrines des hommes, qu’il [le conseiller] soit un djinn, ou un être humain"',
      virtue:
          'سُنَّةٌ دُبُرَ كُلِّ صَلَاةٍ فِي الْأَوْقَاتِ الْعَادِيَّةِ، وَتُكَرَّرُ ثَلَاثاً فِي الصُّبْحِ وَالْمَغْرِبِ.',
      sourceText:
          'عَنْ عُقْبَةَ بْنِ عَامِرٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: "أَمَرَنِي رَسُولُ اللَّهِ ﷺ أَنْ أَقْرَأَ بِالْمُعَوِّذَاتِ دُبُرَ كُلِّ صَلَاةٍ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),

    // --- مشاعري (Emotional Support) ---
    // Sadness (حزينة)
    Dhikr(
      id: 'feel_sad_1',
      sourceText:
          'عَنْ أُمِّ سَلَمَةَ رَضِيَ اللَّهُ عَنْهَا قَالَتْ: سَمِعْتُ رَسُولَ اللَّهِ ﷺ يَقُولُ: "مَا مِنْ مُسْلِمٍ تُصِيبُهُ مُصِيبَةٌ فَيَقُولُ مَا أَمَرَهُ اللَّهُ: {إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ} اللَّهُمَّ أْجُرْنِي فِي مُصِيبَتِي وَأَخْلِفْ لِي خَيْرًا مِنْهَا، إِلَّا أَخْلَفَ اللَّهُ لَهُ خَيْرًا مِنْهَا".',
      sourceRef: 'رواه مسلم',
      category: DhikrCategory.feelings,
      emotionTag: 'sad',
      arabicText:
          'إِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ رَاجِعُونَ، اللَّهُمَّ أْجُرْنِي فِي مُصِيبَتِي، وَأَخْلِفْ لِي خَيْرًا مِنْهَا',
      englishText:
          'We belong to Allah and to Him we shall return. O Allah, reward me for my affliction and give me something better than it in exchange',
      frenchText:
          'Nous sommes à Allah et nous reviendrons à Lui. Ô Allah, récompense-moi dans mon malheur et remplace-le moi par quelque chose de meilleur',
      virtue: 'عِوَضُ اللَّهِ الصَّابِرِينَ بِأَفْضَلَ مِمَّا فَقَدُوا.',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_sad_2',
      category: DhikrCategory.feelings,
      emotionTag: 'sad',
      arabicText:
          'لَا إِلَهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ',
      englishText:
          'There is no god but You, glory be to You, I have indeed been among the wrongdoers',
      frenchText:
          'Il n’y a pas d’autre divinité que Toi, Gloire à Toi, j’ai été du nombre des injustes',
      virtue:
          'دُعَاءُ ذِي النُّونِ، مَا دَعَا بِهِ مُسْلِمٌ فِي كَرْبٍ إِلَّا اسْتَجَابَ اللَّهُ لَهُ.',
      sourceText:
          'دَعَا بِهَا يُونُسُ عَلَيْهِ السَّلَامُ (ذُو النُّونِ) وَهُوَ فِي بَطْنِ الْحُوتِ فِي ظُلُمَاتٍ ثَلَاثٍ، فَاسْتَجَابَ اللَّهُ لَهُ وَنَجَّاهُ مِنَ الْغَمِّ، وَهِيَ دَعْوَةٌ لَا يُرَدُّ قَائِلُهَا.',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_sad_3',
      category: DhikrCategory.feelings,
      emotionTag: 'sad',
      arabicText:
          'اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ، وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ',
      englishText:
          'O Allah, I hope for Your mercy, so do not leave me to myself even for the blinking of an eye, and amend all my affairs for me, there is no god but You',
      frenchText:
          'Ô Allah ! C’est Ta miséricorde que j’espère. Ne me laisse donc pas à mon propre sort, ne serait-ce que le temps d’un clin d’œil. Améliore ma situation entière. Il n’y a de divinité que Toi',
      virtue:
          'دُعَاءُ الْمَكْرُوبِ، لِتَفْوِيضِ الْأَمْرِ كُلِّهِ لِلَّهِ وَتَوْكِيلِهِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "دَعَوَاتُ الْمَكْرُوبِ: اللَّهُمَّ رَحْمَتَكَ أَرْجُو فَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ، وَأَصْلِحْ لِي شَأْنِي كُلَّهُ لَا إِلَهَ إِلَّا أَنْتَ".',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_sad_4',
      category: DhikrCategory.feelings,
      emotionTag: 'sad',
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ',
      englishText:
          'O Allah, I seek refuge in You from anxiety and sorrow, weakness and laziness, miserliness and cowardice, the burden of debts and from being overpowered by men',
      frenchText:
          'Ô Allah ! Je me protège auprès de Toi contre l’anxiété et la tristesse, l’incapacité et la paresse, l’avarice et la lâcheté, le poids de la dette et la domination des hommes',
      virtue:
          'اسْتِعَاذَةٌ شَامِلَةٌ مِنْ آفَاتِ الْقُلُوبِ وَالْأَبْدَانِ وَالدُّيُونِ.',
      sourceText:
          'كَانَ النَّبِيُّ ﷺ يُكْثِرُ مِنْ هَذَا الدُّعَاءِ لِطَلَبِ الْحِمَايَةِ مِنَ الْهُمُومِ وَضُغُوطِ الْحَيَاةِ، وَكَانَ يُوصِي بِهِ أَصْحَابَهُ عِنْدَ الشُّعُورِ بِالضِّيقِ.',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_sad_5',
      category: DhikrCategory.feelings,
      emotionTag: 'sad',
      arabicText: 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
      englishText:
          'Allah is sufficient for us, and He is the best Disposer of affairs',
      frenchText: 'Allah nous suffit, quel excellent Protecteur !',
      virtue:
          'كَلِمَةُ الِاسْتِنْصَارِ فِي الشَّدَائِدِ، لِكِفَايَةِ اللَّهِ لِلْعَبْدِ وَحِمَايَتِهِ.',
      sourceText:
          'قَالَهَا إِبْرَاهِيمُ عَلَيْهِ السَّلَامُ حِينَ أُلْقِيَ فِي النَّارِ فَنَجَّاهُ اللَّهُ، وَقَالَهَا مُحَمَّدٌ ﷺ وَأَصْحَابُهُ حِينَ هُدِّدُوا بِجَمْعِ النَّاسِ عَلَيْهِمْ، فَثَبَّتَهُمُ اللَّهُ.',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
    ),

    // Anxiety (قلقة)
    Dhikr(
      id: 'feel_anxious_1',
      category: DhikrCategory.feelings,
      emotionTag: 'anxious',
      arabicText:
          'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ أَصْلِحْ لِي شَأْنِي كُلَّهُ وَلَا تَكِلْنِي إِلَى نَفْسِي طَرْفَةَ عَيْنٍ',
      englishText:
          'O Ever Living, O Self-Subsisting, by Your mercy I seek help. Amend for me all my affairs and do not leave me to myself even for the blinking of an eye',
      frenchText:
          'Ô Vivant ! Ô Celui qui subsiste par Lui-même ! C’est par Ta miséricorde que j’appelle au secours. Améliore ma situation entière et ne me laisse pas à mon propre sort, ne serait-ce que le temps d’un clin d’œil',
      virtue:
          'وَصِيَّةٌ نَبَوِيَّةٌ لِلِاسْتِغَاثَةِ بِأَسْمَاءِ اللَّهِ الْعُظْمَى لِكِفَايَةِ الْهَمِّ.',
      sourceText:
          'أَوْصَى بِهَا النَّبِيُّ ﷺ ابْنَتَهُ فَاطِمَةَ رَضِيَ اللَّهُ عَنْهَا أَنْ تَقُولَهَا صَبَاحاً وَمَسَاءً لِطَلَبِ الْعَوْنِ الْإِلَهِيِّ فِي كُلِّ شَأْنٍ مِنْ شُؤُونِ الْحَيَاةِ.',
      sourceRef: 'رواه النسائي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_anxious_2',
      category: DhikrCategory.feelings,
      emotionTag: 'anxious',
      arabicText:
          'اللَّهُمَّ إِنِّي عَبْدُكَ، وَابْنُ عَبْدِكَ، وَابْنُ أَمَتِكَ، نَاصِيَتِي بِيَدِكَ، مَاضٍ فِيَّ حُكمُكَ، عَدْلٌ فِيَّ قَضَاؤُكَ، أَسْأَلُكَ بِكُلِّ اسْمٍ هُوَ لَكَ سَمَّيْتَ بِهِ نَفْسَكَ، أَوْ أَنْزَلْتَهُ فِي كِتَابِكَ، أَوْ عَلَّمْتَهُ أَحَدًا مِنْ خَلْقِكَ، أَوِ اسْتَأْثَرْتَ بِهِ فِي عِلْمِ الْغَيْبِ عِنْدَكَ، أَنْ تَجْعَلَ الْقُرْآنَ رَبِيعَ قَلْبِي، وَنُورَ صَدْرِي، وَجَلَاءَ حُزْنِي، وَذَهَابَ هَمِّي',
      englishText:
          'O Allah, I am Your slave, the son of Your slave, the son of Your maidservant; my forelock is in Your hand, Your command over me is forever executed and Your decree over me is just. I ask You by every name belonging to You which You have named Yourself with, or revealed in Your Book, or taught to any of Your creation, or You have preserved in the knowledge of the unseen with You, that You make the Quran the spring of my heart and the light of my chest, the banisher of my sadness and the reliever of my distress',
      frenchText:
          'Ô Allah ! Je suis Ton serviteur, fils de Ton serviteur, fils de Ta servante. Mon toupet est dans Ta main, Ton jugement s’accomplit sur moi, Ton décret sur moi est juste. Je Te demande par chacun de Tes noms par lesquels Tu T’es nommé, ou que Tu as révélé dans Ton Livre, ou que Tu as enseigné à l’une de Tes créatures, ou que Tu as gardé secret dans la science de l’invisible auprès de Toi, de faire du Coran le printemps de mon cœur, la lumière de ma poitrine, la dissipation de ma tristesse et la fin de mes soucis',
      virtue:
          'دُعَاءٌ لِإِذْهَابِ الْهَمِّ وَالْغَمِّ وَإِبْدَالِهِ فَرَحاً وَسُرُوراً.',
      sourceText:
          'عَنْ عَبْدِ اللَّهِ بْنِ مَسْعُودٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ رَسُولُ اللَّهِ ﷺ: "مَا أَصَابَ أَحَدًا قَطُّ هَمٌّ وَلَا حَزَنٌ، فَقَالَ: اللَّهُمَّ إِنِّي عَبْدُكَ، وَابْنُ عَبْدِكَ... إِلَّا أَذْهَبَ اللَّهُ هَمَّهُ وَحُزْنَهُ، وَأَبْدَلَهُ مَكَانَهُ فَرَحًا".',
      sourceRef: 'رواه أحمد',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_anxious_3',
      category: DhikrCategory.feelings,
      emotionTag: 'anxious',
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ الْعَظِيمُ الْحَلِيمُ، لَا إِلَهَ إِلَّا اللَّهُ رَبُّ الْعَرْشِ الْعَظِيمِ، لَا إِلَهَ إِلَّا اللَّهُ رَبُّ السَّمَاوَاتِ وَرَبُّ الْأَرْضِ وَرَبُّ الْعَرْشِ الْكَرِيمِ',
      englishText:
          'There is no god but Allah, the Great, the Forbearing; There is no god but Allah, the Lord of the Magnificent Throne; There is no god but Allah, the Lord of the heavens and the Lord of the earth, and the Lord of the Noble Throne',
      frenchText:
          'Point de divinité à part Allah, le Magnifique, le Clément. Point de divinité à part Allah, le Seigneur du Trône Immense. Point de divinité à part Allah, le Seigneur des cieux, le Seigneur de la terre et le Seigneur du Trône Généreux',
      virtue:
          'دُعَاءُ الْكَرْبِ، لِتَفْرِيجِ الشَّدَائِدِ وَتَهْوِينِ الصِّعَابِ.',
      sourceText:
          'كَانَ النَّبِيُّ ﷺ يَتَوَجَّهُ بِهَذَا التَّمْجِيدِ الْعَظِيمِ لِلَّهِ تَعَالَى عِنْدَ اشْتِدَادِ الْكَرْبِ وَالضِّيقِ، لِمَا فِيهِ مِنْ تَعْظِيمٍ لِرَبِّ السَّمَاوَاتِ وَالْأَرْضِ الْقَادِرِ عَلَى كُلِّ شَيْءٍ.',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_anxious_4',
      category: DhikrCategory.feelings,
      emotionTag: 'anxious',
      arabicText:
          'اللَّهُمَّ اكْفِنِي بِحَلَالِكَ عَنْ حَرَامِكَ، وَأَغْنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ',
      englishText:
          'O Allah, suffice me with what You have allowed instead of what You have forbidden, and make me independent of all others besides You',
      frenchText:
          'Ô Allah ! Accorde-moi de Tes biens licites pour m’épargner Tes interdits, et accorde-moi de Ta grâce pour ne plus dépendre d’aucun autre que Toi',
      virtue:
          'لِقَضَاءِ الدُّيُونِ، لَوْ كَانَ عَلَيْكَ مِثْلُ جَبَلٍ دَيْناً أَدَّاهُ اللَّهُ عَنْكَ.',
      sourceText:
          'جَاءَ رَجُلٌ مَدِينٌ إِلَى عَلِيٍّ رَضِيَ اللَّهُ عَنْهُ يَطْلُبُ الْعَوْنَ، فَعَلَّمَهُ هَذِهِ الْكَلِمَاتِ الَّتِي عَلَّمَهُ إِيَّاهَا رَسُولُ اللَّهِ ﷺ لِقَضَاءِ أَصْعَبِ الدُّيُونِ.',
      sourceRef: 'رواه الترمذي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_anxious_5',
      category: DhikrCategory.feelings,
      emotionTag: 'anxious',
      arabicText: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      englishText: 'There is no might and no power except with Allah',
      frenchText: 'Il n’y a de force et de puissance que par Allah',
      virtue:
          'كَنْزٌ مِنْ كُنُوزِ الْجَنَّةِ، وَدَوَاءٌ لِأَيْسَرِ الدَّاءِ وَهُوَ الْهَمُّ.',
      sourceText:
          'وَصِيَّةٌ نَبَوِيَّةٌ مُتَكَرِّرَةٌ لِأَصْحَابِهِ، لِغَرْسِ التَّوَكُّلِ التَّامِّ فِي الْقُلُوبِ وَالِاعْتِرَافِ بِضَعْفِ الْعَبْدِ أَمَامَ قُوَّةِ الْخَالِقِ فِي مُوَاجَهَةِ الصِّعَابِ.',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),

    // Happy (سعيدة)
    Dhikr(
      id: 'feel_happy_1',
      category: DhikrCategory.feelings,
      emotionTag: 'happy',
      arabicText:
          'الْحَمْدُ لِلَّهِ الَّذِي بِنِعْمَتِهِ تَتِمُّ الصَّالِحَاتُ',
      englishText:
          'Praise be to Allah, by Whose grace good things are accomplished',
      frenchText:
          'Louange à Allah par la grâce de qui s’accomplissent les bonnes œuvres',
      virtue:
          'شُكْرٌ لِلَّهِ عِنْدَ السُّرُورِ، وَاعْتِرَافٌ بِفَضْلِهِ فِي تَمَامِ النِّعَمِ.',
      sourceText:
          'كَانَ النَّبِيُّ ﷺ إِذَا رَأَى مَا يَسُرُّهُ وَيُحِبُّهُ بَادَرَ بِحَمْدِ اللَّهِ وَالِاعْتِرَافِ بِفَضْلِهِ، لِيَدُومَ الْخَيْرُ وَتَزْدَادَ النِّعْمَةُ بِالشُّكْرِ.',
      sourceRef: 'رواه ابن ماجه',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_happy_2',
      category: DhikrCategory.feelings,
      emotionTag: 'happy',
      arabicText:
          'رَبِّ أَوْزِعْنِي أَنْ أَشْكُرَ نِعْمَتَكَ الَّتِي أَنْعَمْتَ عَلَيَّ وَعَلَى وَالِدَيَّ وَأَنْ أَعْمَلَ صَالِحًا تَرْضَاهُ',
      englishText:
          'My Lord, enable me to be grateful for Your favor which You have bestowed upon me and upon my parents and to do righteousness of which You approve',
      frenchText:
          'Seigneur ! Permets-moi d’être reconnaissant pour le bienfait dont Tu m’as comblé, ainsi que mes parents, et de faire le bien qui Te dise',
      virtue:
          'دُعَاءُ الْأَنْبِيَاءِ لِطَلَبِ التَّوْفِيقِ لِلشُّكْرِ وَزِيَادَةِ النِّعَمِ.',
      sourceText:
          'دُعَاءُ نَبِيِّ اللَّهِ سُلَيْمَانَ عَلَيْهِ السَّلَامُ عِنْدَمَا رَأَى نِعَمَ اللَّهِ تَتَوَالَى عَلَيْهِ، حَيْثُ سَأَلَ رَبَّهُ أَنْ يُوَفِّقَهُ لِلشُّكْرِ الَّذِي يُرْضِيهِ وَيَحْفَظَ النِّعْمَةَ.',
      sourceRef: 'القرآن الكريم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_happy_3',
      category: DhikrCategory.feelings,
      emotionTag: 'happy',
      arabicText:
          'اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ، وَشُكْرِكَ، وَحُسْنِ عِبَادَتِكَ',
      englishText:
          'O Allah, help me to remember You, to give thanks to You and to worship You in the best way',
      frenchText:
          'Ô Allah ! Aide-moi à T’évoquer, à Te remercier et à T’adorer de la meilleure manière',
      virtue:
          'وَصِيَّةٌ نَبَوِيَّةٌ لِطَلَبِ الْعَوْنِ عَلَى الذِّكْرِ وَالشُّكْرِ وَحُسْنِ الْعِبَادَةِ.',
      sourceText:
          'أَمْسَكَ النَّبِيُّ ﷺ بِيَدِ مُعَاذِ بْنِ جَبَلٍ وَقَالَ لَهُ: "يَا مُعَاذُ، وَاللَّهِ إِنِّي لَأُحِبُّكَ"، ثُمَّ أَوْصَاهُ أَلَّا يَدَعَ هَذَا الدُّعَاءَ بَعْدَ كُلِّ صَلَاةٍ.',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_happy_4',
      category: DhikrCategory.feelings,
      emotionTag: 'happy',
      arabicText: 'مَا شَاءَ اللَّهُ لَا قُوَّةَ إِلَّا بِاللَّهِ',
      englishText:
          'What Allah willed [has occurred]; there is no power except in Allah',
      frenchText:
          'Telle est la volonté d’Allah ! Il n’y a de puissance que par Allah',
      virtue:
          'لِحِفْظِ النِّعَمِ مِنَ الزَّوَالِ وَالْعَيْنِ، وَحُلُولِ الْبَرَكَةِ.',
      sourceText:
          'تَذْكِرَةٌ بَلِيغَةٌ وَرَدَتْ فِي سُورَةِ الْكَهْفِ لِرَدِّ الْفَضْلِ لِلَّهِ عِنْدَ رُؤْيَةِ النِّعَمِ، وَهِيَ حِصْنٌ لِلْمُمْتَلَكَاتِ وَالْأَرْزَاقِ مِنَ الْعَيْنِ وَالْحَسَدِ وَكِبْرِ النَّفْسِ.',
      sourceRef: 'القرآن الكريم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_happy_5',
      category: DhikrCategory.feelings,
      emotionTag: 'happy',
      arabicText:
          'الْحَمْدُ لِلَّهِ حَمْداً كَثِيراً طَيِّباً مُبَارَكاً فِيهِ',
      englishText: 'Praise be to Allah, much praise, good and blessed',
      frenchText: 'Louange à Allah, une louange abondante, pure et bénie',
      virtue:
          'تَمْجِيدٌ عَظِيمٌ لِلَّهِ، يَبْتَدِرُهُ الْمَلَائِكَةُ لِكِتَابَتِهِ مِنْ عِظَمِ أَجْرِهِ.',
      sourceText:
          'قَالَهَا أَحَدُ الصَّحَابَةِ خَلْفَ النَّبِيِّ ﷺ فِي الصَّلَاةِ، فَبَشَّرَهُ النَّبِيُّ ﷺ أَنَّ أَكْثَرَ مِنْ ثَلَاثِينَ مَلَكاً يَبْتَدِرُونَهَا أَيُّهُمْ يَكْتُبُهَا أَوَّلاً لِعِظَمِ قَدْرِهَا.',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
    ),

    // Tired (متعبة)
    Dhikr(
      id: 'tired_tasbih_subhanallah',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText: 'سُبْحَانَ اللَّهِ',
      englishText: 'Glory is to Allah',
      frenchText: 'Gloire à Allah',
      virtue:
          'يُقَالُ عِنْدَ التَّعَبِ الْجَسَدِيِّ، وَهُوَ خَيْرٌ مِنْ خَادِمٍ وَيُقَوِّي الْبَدَنَ.',
      sourceText:
          'شَكَتْ فَاطِمَةُ رَضِيَ اللَّهُ عَنْهَا مِنْ أَثَرِ الْعَمَلِ الشَّاقِّ، فَعَلَّمَهَا النَّبِيُّ ﷺ هِيَ وَعَلِيّاً هَذَا التَّسْبِيحَ وَالتَّحْمِيدَ وَالتَّكْبِيرَ عِنْدَ النَّوْمِ، وَأَخْبَرَهَا أَنَّهُ خَيْرٌ لَهُمَا مِنْ خَادِمٍ يُعِينُهُمَا.',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'tired_tasbih_alhamdulillah',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText: 'الْحَمْدُ لِلَّهِ',
      englishText: 'Praise is to Allah',
      frenchText: 'Louange à Allah',
      virtue:
          'يُقَالُ عِنْدَ التَّعَبِ الْجَسَدِيِّ، وَهُوَ خَيْرٌ مِنْ خَادِمٍ وَيُقَوِّي الْبَدَنَ.',
      sourceText:
          'وَصِيَّةٌ نَبَوِيَّةٌ لِفَاطِمَةَ وَعَلِيٍّ رَضِيَ اللَّهُ عَنْهُمَا عِنْدَ الشُّعُورِ بِالْإِرْهَاقِ، طَلَبًا لِلْعَوْنِ وَالْقُوَّةِ مِنَ اللَّهِ تَعَالَى.',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'tired_tasbih_allahuakbar',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText: 'اللَّهُ أَكْبَرُ',
      englishText: 'Allah is the Greatest',
      frenchText: 'Allah est le plus Grand',
      virtue:
          'يُقَالُ عِنْدَ التَّعَبِ الْجَسَدِيِّ، وَهُوَ خَيْرٌ مِنْ خَادِمٍ وَيُقَوِّي الْبَدَنَ.',
      sourceText:
          'جُزْءٌ مِنَ الذِّكْرِ الَّذِي عَلَّمَهُ النَّبِيُّ ﷺ لِابْنَتِهِ لِيَكُونَ لَهَا عَوْناً وَسَنَداً بَدَلاً مِنَ الْخَادِمِ، فَهُوَ يُقَوِّي الرُّوحَ وَالْبَدَنَ.',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_tired_2',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText:
          'اللَّهُمَّ عَافِنِي فِي بَدَنِي، اللَّهُمَّ عَافِنِي فِي سَمْعِي، اللَّهُمَّ عَافِنِي فِي بَصَرِي، لَا إِلَهَ إِلَّا أَنْتَ',
      englishText:
          'O Allah, make me healthy in my body. O Allah, make me healthy in my hearing. O Allah, make me healthy in my sight. None has the right to be worshipped except You',
      frenchText:
          'Ô Allah ! Préserve ma santé dans mon corps. Ô Allah ! Préserve mon ouïe. Ô Allah ! Préserve ma vue. Point de divinité à part Toi',
      virtue:
          'طَلَبُ الْعَافِيَةِ التَّامَّةِ لِلْبَدَنِ وَالْحَوَاسِّ، وَحِفْظُ الصِّحَّةِ.',
      sourceText:
          'دُعَاءٌ عَلَّمَهُ الصَّحَابَةُ لِأَبْنَائِهِمْ لِلِاسْتِمْرَارِ عَلَيْهِ كُلَّ صَبَاحٍ وَمَسَاءٍ، طَلَبًا لِحِفْظِ اللَّهِ لِلصِّحَّةِ الْبَدَنِيَّةِ وَالْحَوَاسِّ الَّتِي هِيَ أَدَوَاتُ الْعِبَادَةِ وَالْعَمَلِ.',
      sourceRef: 'رواه أبو داود',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_tired_3',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText:
          'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
      englishText:
          'None has the right to be worshipped except Allah, alone, without partner. To Him belongs all sovereignty and praise and He is over all things omnipotent',
      frenchText:
          'Il n’y a de divinité qu’Allah, l’Unique sans associé. À Lui la royauté et la louange, et Il est Capable de toute chose',
      virtue:
          'تَجْدِيدٌ لِلتَّوْحِيدِ وَنَشَاطٌ لِلرُّوحِ، وَحِصْنٌ مِنَ الشَّيْطَانِ.',
      sourceText:
          'تَعْدِلُ عِتْقَ رِقَابٍ فِي الْأَجْرِ، وَتَكُونُ لِلْمُسْلِمِ حِرْزاً مِنَ الشَّيْطَانِ يَوْمَهُ ذَلِكَ حَتَّى يُمْسِيَ، وَتَجْلِبُ السَّكِينَةَ وَتُذْهِبُ وَهْنَ النَّفْسِ وَتَعَبَهَا.',
      sourceRef: 'رواه البخاري',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_tired_4',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText: 'اللَّهُمَّ بَارِكْ لِي فِي وَقْتِي وَجُهْدِي',
      englishText: 'O Allah, bless my time and my efforts',
      frenchText: 'Ô Allah ! Bénis mon temps et mes efforts',
      virtue:
          'طَلَبُ الْبَرَكَةِ فِي الْوَقْتِ وَالْجُهْدِ، لِإِنْجَازِ الْكَثِيرِ بِالْقَلِيلِ.',
      sourceText:
          'دُعَاءٌ مَأْثُورٌ يُطْلَبُ بِهِ الْعَوْنُ مِنَ اللَّهِ لِمُبَارَكَةِ الْقَلِيلِ مِنَ الْجُهْدِ وَالْوَقْتِ لِيُثْمِرَ كَثِيراً مِنَ الْخَيْرِ وَالنَّجَاحِ.',
      sourceRef: 'أدعية مأثورة',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_tired_5',
      category: DhikrCategory.feelings,
      emotionTag: 'tired',
      arabicText:
          'أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ وَأَتُوبُ إِلَيْهِ',
      englishText:
          'I seek the forgiveness of Allah the Magnificent, besides Whom there is no other god, the Living, the Self-Subsisting, and I repent to Him',
      frenchText:
          'Je demande pardon à Allah l’Immense, en dehors de Qui il n’y a point de divinité, le Vivant, Celui qui subsiste par Lui-même, et je me repens à Lui',
      virtue:
          'الِاسْتِغْفَارُ مَجْلَبَةٌ لِلْقُوَّةِ وَالرِّزْقِ، وَيَزِيدُكُمْ قُوَّةً إِلَى قُوَّتِكُمْ.',
      sourceText:
          'قَرَنَ اللَّهُ تَعَالَى الِاسْتِغْفَارَ بِزِيَادَةِ الْقُوَّةِ الْبَدَنِيَّةِ وَالْمَادِيَّةِ، فَهُوَ يَفْتَحُ الْأَبْوَابَ الْمُغْلَقَةَ وَيَمْنَحُ الْمُسْلِمَ طَاقَةً مُتَجَدِّدَةً لِمُوَاصَلَةِ حَيَاتِهِ.',
      sourceRef: 'القرآن الكريم',
      repetitions: 1,
    ),

    // Lost (تائهة)
    Dhikr(
      id: 'feel_lost_1',
      category: DhikrCategory.feelings,
      emotionTag: 'lost',
      arabicText: 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ',
      englishText: 'O Turner of hearts, keep my heart firm on Your religion',
      frenchText:
          'Ô Toi qui retournes les cœurs ! Raffermis mon cœur dans Ta religion',
      virtue:
          'كَانَ أَكْثَرُ دُعَاءِ النَّبِيِّ ﷺ لِطَلَبِ الثَّبَاتِ عِنْدَ الْفِتَنِ.',
      sourceText:
          'عَنْ أَنَسٍ رَضِيَ اللَّهُ عَنْهُ قَالَ: كَانَ رَسُولُ اللَّهِ ﷺ يُكْثِرُ أَنْ يَقُولَ: "يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ"، فَقُلْتُ: يَا رَسُولَ اللَّهِ، آمَنَّا بِكَ وَبِمَا جِئْتَ بِهِ فَهَلْ تَخَافُ عَلَيْنَا؟ قَالَ: "نَعَمْ، إِنَّ الْقُلُوبَ بَيْنَ أُصْبُعَيْنِ مِنْ أَصَابِعِ اللَّهِ يُقَلِّبُهَا كَيْفَ يَشَاءُ".',
      sourceRef: 'رَوَاهُ التِّرْمِذِيُّ',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_lost_2',
      category: DhikrCategory.feelings,
      emotionTag: 'lost',
      arabicText: 'اللَّهُمَّ اهْدِنِي وَسَدِّدْنِي',
      englishText: 'O Allah, guide me and keep me on the right path',
      frenchText: 'Ô Allah ! Guis-moi et affermis mes pas',
      virtue:
          'طَلَبُ الْهِدَايَةِ وَالسَّدَادِ، وَتَوْفِيقُ اللَّهِ لِلْحَقِّ عِنْدَ الْحَيْرَةِ.',
      sourceText:
          'عَنْ عَلِيٍّ رَضِيَ اللَّهُ عَنْهُ قَالَ: قَالَ لِي رَسُولُ اللَّهِ ﷺ: "قُلِ: اللَّهُمَّ اهْدِنِي وَسَدِّدْنِي، وَاذْكُرْ بِالْهُدَى هِدَايَتَكَ الطَّرِيقَ، وَالسَّدَادَ سَدَادَ السَّهْمِ".',
      sourceRef: 'رواه مسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_lost_3',
      category: DhikrCategory.feelings,
      emotionTag: 'lost',
      arabicText:
          'رَبَّنَا لَا تُزِغْ قُلُوبَنَا بَعْدَ إِذْ هَدَيْتَنَا وَهَبْ لَنَا مِنْ لَدُنْكَ رَحْمَةً إِنَّكَ أَنْتَ الْوَهَّابُ',
      englishText:
          'Our Lord, let not our hearts deviate after You have guided us and grant us from Yourself mercy. Indeed, You are the Bestower',
      frenchText:
          'Seigneur ! Ne laisse pas nos cœurs dévier après que Tu nous as guidés ; et accorde-nous Ta miséricorde. C’est Toi, certes, le Grand Dispensateur',
      virtue:
          'دُعَاءُ الرَّاسِخِينَ فِي الْعِلْمِ لِلْحِمَايَةِ مِنَ الضَّلَالِ بَعْدَ الْهِدَايَةِ.',
      sourceText:
          'دُعَاءُ الرَّاسِخِينَ فِي الْعِلْمِ الَّذِينَ أَثْنَى اللَّهُ عَلَيْهِمْ فِي كِتَابِهِ الْعَزِيزِ، فَهُمْ يَسْأَلُونَ اللَّهَ الثَّبَاتَ عَلَى الْهُدَى بَعْدَ إِذْ مَنَّ بِهِ عَلَيْهِمْ، وَيَسْأَلُونَهُ الرَّحْمَةَ مِنْ لَدُنْهُ.',
      sourceRef: 'القرآن الكريم (آل عمران)',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_lost_4',
      category: DhikrCategory.feelings,
      emotionTag: 'lost',
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى وَالتُّقَى وَالْعَفَافَ وَالْغِنَى',
      englishText:
          'O Allah, I ask You for guidance, piety, chastity and self-sufficiency',
      frenchText:
          'Ô Allah ! Je Te demande la guidée, la piété, la chasteté et la suffisance',
      virtue:
          'طَلَبُ أُصُولِ الْخَيْرِ كُلِّهَا: الْهُدَى وَالتُّقَى وَالْعَفَافُ وَالْغِنَى.',
      sourceText:
          'عَنْ عَبْدِ اللَّهِ بْنِ مَسْعُودٍ رَضِيَ اللَّهُ عَنْهُ عَنِ النَّبِيِّ ﷺ أَنَّهُ كَانَ يَقُولُ: "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْهُدَى، وَالتُّقَى، وَالْعَفَافَ، وَالْغِنَى".',
      sourceRef: 'رواه مسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_lost_5',
      category: DhikrCategory.feelings,
      emotionTag: 'lost',
      arabicText:
          'اللَّهُمَّ رَبَّ جِبْرَائِيلَ وَمِيكَائِيلَ وَإِسْرَافِيلَ، فَاطِرَ السَّمَاوَاتِ وَالأَرْضِ، عَالِمَ الْغَيْبِ وَالشَّهَادَةِ، أَنْتَ تَحْكُمُ بَيْنَ عِبَادِكَ فِيمَا كَانُوا فِيهِ يَخْتَلِفُونَ، اهْدِنِي لِمَا اخْتُلِفَ فِيهِ مِنَ الْحَقِّ بِإِذْنِكَ، إِنَّكَ تَهْدِي مَنْ تَشَاءُ إِلَى صِرَاطٍ مُسْتَقِيمٍ',
      englishText:
          'O Allah, Lord of Jibrail, Mikhail and Israfil, Creator of the heavens and the earth, Knower of the unseen and the seen, You judge between Your servants concerning that wherein they differ. Guide me to the truth concerning that wherein they differed by Your permission. Verily, You guide whom You will to a straight path',
      frenchText:
          'Ô Allah ! Seigneur de Jibrîl, Mîkâ’îl et Isrâfîl, Créateur des cieux et de la terre, Connaisseur de l’invisible et du visible. C’est Toi qui juges entre Tes serviteurs ce sur quoi ils divergeaient. Guide-moi, avec Ta permission, vers la vérité là où il y a eu divergence. Certes, Tu guides qui Tu veux vers le droit chemin',
      virtue:
          'دُعَاءٌ لِكَشْفِ الْحَقِيقَةِ وَالِالْتِبَاسِ عِنْدَ تَضَارُبِ الْآرَاءِ.',
      sourceText:
          'عَنْ عَائِشَةَ رَضِيَ اللَّهُ عَنْهَا قَالَتْ: كَانَ رَسُولُ اللَّهِ ﷺ إِذَا قَامَ مِنَ اللَّيْلِ افْتَتَحَ صَلَاتَهُ: "اللَّهُمَّ رَبَّ جِبْرَائِيلَ وَمِيكَائِيلَ وَإِسْرَافِيلَ، فَاطِرَ السَّمَاوَاتِ وَالْأَرْضِ، عَالِمَ الْغَيْبِ وَالشَّهَادَةِ، أَنْتَ تَحْكُمُ بَيْنَ عِبَادِكَ فِيمَا كَانُوا فِيهِ يَخْتَلِفُونَ، اهْدِنِي لِمَا اخْتُلِفَ فِيهِ مِنَ الْحَقِّ بِإِذْنِكَ، إِنَّكَ تَهْدِي مَنْ تَشَاءُ إِلَى صِرَاطٍ مُسْتَقِيمٍ".',
      sourceRef: 'رواه مسلم',
      repetitions: 1,
    ),

    // Angry (غاضبة)
    Dhikr(
      id: 'feel_angry_1',
      category: DhikrCategory.feelings,
      emotionTag: 'angry',
      arabicText: 'أَعُوذُ بِاللَّهِ مِنَ الشَّيْطَانِ الرَّجِيمِ',
      englishText: 'I seek refuge in Allah from Satan the outcast',
      frenchText: 'Je cherche protection auprès d’Allah contre Satan le maudit',
      virtue:
          'يُذْهِبُ جَمْرَةَ الشَّيْطَانِ مِنَ الْقَلْبِ وَيُطْفِئُ الْغَضَبَ.',
      sourceText:
          'رَأَى النَّبِيُّ ﷺ رَجُلَيْنِ يَتَسَابَّانِ وَقَدِ اشْتَدَّ غَضَبُ أَحَدِهِمَا حَتَّى احْمَرَّ وَجْهُهُ، فَقَالَ: "إِنِّي لَأَعْلَمُ كَلِمَةً لَوْ قَالَهَا لَذَهَبَ عَنْهُ مَا يَجِدُ"، وَهِيَ هَذِهِ الِاسْتِعَاذَةُ.',
      sourceRef: 'رواه البخاري ومسلم',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_angry_2',
      category: DhikrCategory.feelings,
      emotionTag: 'angry',
      arabicText:
          'اللَّهُمَّ اغْفِرْ لِي ذَنْبِي، وَأَذْهِبْ غَيْظَ قَلْبِي، وَأَجِرْنِي مِنَ الشَّيْطَانِ',
      englishText:
          'O Allah, forgive my sin, remove the anger of my heart, and protect me from Satan',
      frenchText:
          'Ô Allah ! Pardonne mes péchés, dissipe la colère de mon cœur et protège-moi de Satan',
      virtue:
          'دُعَاءٌ لِسَكِينَةِ الْقَلْبِ وَالتَّحَكُّمِ فِي النَّفْسِ وَطَلَبِ الْمَغْفِرَةِ.',
      sourceText:
          'جَاءَ فِي بَعْضِ الرِّوَايَاتِ أَنَّ النَّبِيَّ ﷺ عَلَّمَ هَذَا الدُّعَاءَ لِتَسْكِينِ الْغَضَبِ وَطَرْدِ نَزَغَاتِ الشَّيْطَانِ عَنِ الْقَلْبِ.',
      sourceRef: 'رواه ابن السني',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_angry_3',
      category: DhikrCategory.feelings,
      emotionTag: 'angry',
      arabicText:
          'اللَّهُمَّ رَبَّ النَّبِيِّ مُحَمَّدٍ اغْفِرْ لِي ذَنْبِي وَأَذْهِبْ غَيْظَ قَلْبِي وَأَعِذْنِي مِنْ مُضِلَّاتِ الْفِتَنِ',
      englishText:
          'O Allah, Lord of the Prophet Muhammad, forgive my sin, remove the anger of my heart, and protect me from the misleading trials',
      frenchText:
          'Ô Allah ! Seigneur du Prophète Muhammad, pardonne mon péché, dissipe la colère de mon cœur et protège-moi des épreuves qui égarent',
      virtue:
          'لِلتَّغَلُّبِ عَلَى الْغَضَبِ الشَّدِيدِ وَالْفِتَنِ، وَالثَّبَاتِ عَلَى الْحَقِّ.',
      sourceText:
          'عَنْ أُمِّ سَلَمَةَ رَضِيَ اللَّهُ عَنْهَا قَالَتْ: يَا رَسُولَ اللَّهِ عَلِّمْنِي كَلِمَةً أَدْعُو بِهَا لِنَفْسِي، قَالَ: "قُولِي: اللَّهُمَّ رَبَّ النَّبِيِّ مُحَمَّدٍ اغْفِرْ لِي ذَنْبِي، وَأَذْهِبْ غَيْظَ قَلْبِي، وَأَعِذْنِي مِنْ مُضِلَّاتِ الْفِتَنِ".',
      sourceRef: 'رواه أحمد',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_angry_4',
      category: DhikrCategory.feelings,
      emotionTag: 'angry',
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ كَلِمَةَ الْحَقِّ فِي الْغَضَبِ وَالرِّضَا',
      englishText:
          'O Allah, I ask You for the word of truth in anger and in pleasure',
      frenchText:
          'Ô Allah ! Je Te demande la parole de vérité dans la colère comme dans la satisfaction',
      virtue:
          'لِضَمَانِ الْعَدْلِ وَالصِّدْقِ وَالْحِكْمَةِ حَتَّى عِنْدَ الْغَضَبِ.',
      sourceText:
          'جَاءَ فِي حَدِيثِ عَمَّارِ بْنِ يَاسِرٍ رَضِيَ اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ ﷺ كَانَ يَدْعُو بِهَذِهِ الدَّعَوَاتِ: "... وَأَسْأَلُكَ كَلِمَةَ الْحَقِّ فِي الْغَضَبِ وَالرِّضَا".',
      sourceRef: 'رواه النسائي',
      repetitions: 1,
    ),
    Dhikr(
      id: 'feel_angry_5',
      category: DhikrCategory.feelings,
      emotionTag: 'angry',
      arabicText:
          'اللَّهُمَّ قِنِي شَرَّ نَفْسِي، وَاعْزِمْ لِي عَلَى أَرْشَدِ أَمْرِي',
      englishText:
          'O Allah, protect me from the evil of myself and confirm for me the most guided course of my affairs',
      frenchText:
          'Ô Allah ! Protège-moi contre mon propre mal, et affermis-moi pour suivre la voie la plus droite',
      virtue:
          'لِلسَّيْطَرَةِ عَلَى هَوَى النَّفْسِ وَرَدْعِهَا عَنِ الْخَطَأِ.',
      sourceText:
          'عَنْ حُصَيْنِ بْنِ عُبَيْدٍ رَضِيَ اللَّهُ عَنْهُ أَنَّ النَّبِيَّ ﷺ قَالَ لَهُ حِينَ أَسْلَمَ: "قُلِ: اللَّهُمَّ قِنِي شَرَّ نَفْسِي، وَاعْزِمْ لِي عَلَى أَرْشَدِ أَمْرِي".',
      sourceRef: 'رواه أحمد',
      repetitions: 1,
    ),

    // --- أذكار الخروج من المنزل ---
    Dhikr(
      id: 'leaving_home_1',
      category: DhikrCategory.leavingHome,
      arabicText:
          'بِسْمِ اللَّهِ، تَوَكَّلْتُ عَلَى اللَّهِ، وَلَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
      englishText:
          'In the name of Allah, I place my trust in Allah, there is no might nor power except with Allah',
      frenchText:
          'Au nom d\'Allah, je place ma confiance en Allah, il n\'y a de force et de puissance que par Allah',
      virtue:
          'يُقَالُ لَهُ: هُدِيْتَ، وَكُفِيتَ، وَوُقِيتَ، وَتَتَنَحَّى عَنْهُ الشَّيَاطِينُ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "إِذَا خَرَجَ الرَّجُلُ مِنْ بَيْتِهِ فَقَالَ: بِسْمِ اللَّهِ... قِيلَ لَهُ: هُدِيْتَ وَكُفِيتَ وَوُقِيتَ".',
      sourceRef: 'رَوَاهُ أَبُو دَاوُدَ وَالتِّرْمِذِيُّ',
      repetitions: 1,
    ),
    Dhikr(
      id: 'leaving_home_2',
      category: DhikrCategory.leavingHome,
      arabicText:
          'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أَضِلَّ، أَوْ أُضَلَّ، أَوْ أَزِلَّ، أَوْ أُزَلَّ، أَوْ أَظْلِمَ، أَوْ أُظْلَمَ، أَوْ أَجْهَلَ، أَوْ يُجْهَلَ عَلَيَّ',
      englishText:
          'O Allah, I seek refuge in You lest I stray or be led astray, or slip or be made to slip, or cause injustice or suffer injustice, or be ignorant or be treated with ignorance',
      frenchText:
          'Ô Allah ! Je me réfugie en Toi de ce que je m\'égare ou que je sois égaré, que je glisse ou que l\'on me fasse glisser, que je commette une injustice ou que j\'en subisse une, que je sois ignorant ou qu\'on le soit envers moi',
      virtue: 'حماية شاملة من الزلل والظلم والجهل.',
      sourceText:
          'عَنْ أُمِّ سَلَمَةَ رَضِيَ اللَّهُ عَنْهَا قَالَتْ: مَا خَرَجَ النَّبِيُّ ﷺ مِنْ بَيْتِي قَطُّ إِلَّا رَفَعَ طَرْفَهُ إِلَى السَّمَاءِ فَقَالَ: "اللَّهُمَّ إِنِّي أَعُوذُ بِكَ أَنْ أَضِلَّ، أَوْ أُضَلَّ، أَوْ أَزِلَّ، أَوْ أُزَلَّ، أَوْ أَظْلِمَ، أَوْ أُظْلَمَ، أَوْ أَجْهَلَ، أَوْ يُجْهَلَ عَلَيَّ".',
      sourceRef: 'رواه أبو داود والترمذي',
      repetitions: 1,
    ),

    // --- أذكار الدخول إلى المنزل ---
    Dhikr(
      id: 'entering_home',
      category: DhikrCategory.enteringHome,
      arabicText:
          'اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلِجِ، وَخَيْرَ الْمَخْرَجِ، بِسْمِ اللَّهِ وَلَجْنَا، وَبِسْمِ اللَّهِ خَرَجْنَا، وَعَلَى اللَّهِ رَبِّنَا تَوَكَّلْنَا',
      englishText:
          'In the name of Allah we enter, in the name of Allah we leave, and upon Allah our Lord we depend',
      frenchText:
          'Au nom d\'Allah nous entrons, au nom d\'Allah nous sortons, et en Allah notre Seigneur nous plaçons notre confiance',
      virtue:
          'السُّنَّةُ عِنْدَ الدُّخُولِ ذِكْرُ اللَّهِ ثُمَّ السَّلَامُ عَلَى الْأَهْلِ، فَإِنَّهُ يَمْنَعُ الشَّيْطَانَ مِنَ الْمَبِيتِ فِي الْبَيْتِ.',
      sourceText:
          'قَالَ رَسُولُ اللَّهِ ﷺ: "إِذَا دَخَلَ الرَّجُلُ بَيْتَهُ، فَذَكَرَ اللَّهَ تَعَالَى عِنْدَ دُخُولِهِ وَعِنْدَ طَعَامِهِ، قَالَ الشَّيْطَانُ: لَا مَبِيتَ لَكُمْ وَلَا عَشَاءَ". وَعَنْ أَبِي مَالِكٍ الْأَشْعَرِيِّ رَضِيَ اللَّهُ عَنْهُ أَنَّ رَسُولَ اللَّهِ ﷺ قَالَ: "إِذَا وَلَجَ الرَّجُلُ بَيْتَهُ، فَلْيَقُلْ: اللَّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ الْمَوْلِجِ، وَخَيْرَ الْمَخْرَجِ، بِسْمِ اللَّهِ وَلَجْنَا، وَبِسْمِ اللَّهِ خَرَجْنَا، وَعَلَى اللَّهِ رَبِّنَا تَوَكَّلْنَا، ثُمَّ لِيُسَلِّمْ عَلَى أَهْلِهِ".',
      sourceRef: 'رَوَاهُ مُسْلِمٌ وَأَبُو دَاوُدَ',
      repetitions: 1,
    ),
  ];

  static List<Dhikr> getByCategory(DhikrCategory category) {
    return adhkars.where((d) => d.category == category).toList();
  }

  static List<Dhikr> getByEmotion(String emotionTag) {
    return adhkars.where((d) => d.emotionTag == emotionTag).toList();
  }
}
