import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'feel_sad_1': 'Innā lillāhi wa-innā ilayhi rāji‘ūn, Allāhumma’-jurnī fī muṣībatī, wa-akhlif lī khayran minhā',
    'feel_sad_2': 'Lā ilāha illā anta subḥānaka innī kuntu mina aẓ-ẓālimīn',
    'feel_sad_3': 'Allāhumma raḥmataka arjū falā takilnī ilā nafsī ṭarfata ‘ayn, wa-aṣliḥ lī sha’nī kullahu lā ilāha illā ant',
    'feel_sad_4': 'Allāhumma innī a‘ūdhu bika mina al-hammi wa-l-ḥazan, wa-l-‘ajzi wa-l-kasal, wa-l-jubni wa-l-bukhl, wa-ḍala‘i ad-dayni wa-ghalabati ar-rijāl',
    'feel_sad_5': 'Ḥasbunā Allāhu wa-ni‘ma al-wakīl',
    'feel_anxious_1': 'Yā Ḥayyu yā Qayyūm bi-raḥmatika astaghīth aṣliḥ lī sha’nī kullahu wa-lā takilnī ilā nafsī ṭarfata ‘ayn',
    'feel_anxious_2': 'Allāhumma innī ‘abduk, wa-ibnu ‘abdik, wa-ibnu amatik, nāṣiyatī bi-yadik, māḍin fiyya ḥukmuk, ‘adlun fiyya qaḍā’uk, as’aluka bi-kulli ismin huwa lak sammayta bihi nafsak, aw anzaltahu fī kitābik, aw ‘allamtahu aḥadan min khalqik, aw ista’tharta bihi fī ‘ilmi al-ghaybi ‘indak, an taj‘ala al-qur’āna rabī‘a qalbī, wa-nūra ṣadrī, wa-jalā’a ḥuznī, wa-dhahāba hammī',
    'feel_anxious_3': 'Lā ilāha illā Allāhu al-‘aẓīmu al-ḥalīm, lā ilāha illā Allāhu rabbu al-‘arshi al-‘aẓīm, lā ilāha illā Allāhu rabbu as-samāwāti wa-rabbu al-arḍi wa-rabbu al-arshi al-karīm',
    'feel_anxious_4': 'Allāhumma-kfinī bi-ḥalālika ‘an ḥarāmik, wa-aghninī bi-faḍlika ‘amman siwāk',
    'feel_anxious_5': 'Lā ḥawla wa-lā quwwata illā billāh',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"]{2},"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour des adhkars Sad/Anxious terminée.")
