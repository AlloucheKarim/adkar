import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'feel_lost_1': 'Yā muqalliba al-qulūbi thabbit qalbī ‘alā dīnik',
    'feel_lost_2': 'Allāhumma ihdinī wa-saddidnī',
    'feel_lost_3': 'Rabbanā lā tuzigh qulūbanā ba‘da idh hadaytanā wa-hab lanā min ladunka raḥmatan innaka anta al-wahhāb',
    'feel_lost_4': 'Allāhumma innī as’aluka al-hudā wa-t-tuqā wa-l-‘afāfa wa-l-ghinā',
    'feel_lost_5': 'Allāhumma rabba Jibrā’īla wa-Mīkā’īla wa-Isrāfīla, fāṭira as-samāwāti wa-l-arḍ, ‘ālimal-ghaybi wash-shahādah, anta taḥkumu bayna ‘ibādika fīmā kānū fīhi yakhtalifūn, ihdinī limā akhtulifa fīhi mina al-ḥaqqi bi-idhnika, innaka tahdī man tashā’u ilā ṣirāṭin mustaqīm',
    'feel_angry_1': 'A‘ūdhu billāhi min ash-shayṭān ir-rajīm',
    'feel_angry_2': 'Allāhumma ighfir lī dhanbī, wa-adhhib ghayẓa qalbī, wa-ajirnī mina ash-shayṭān',
    'feel_angry_3': 'Allāhumma rabba an-nabiyyi Muḥammad ighfir lī dhanbī wa-adhhib ghayẓa qalbī wa-a‘idhnī min muḍillāti al-fitan',
    'feel_angry_4': 'Allāhumma innī as’aluka kalimata al-ḥaqqi fī al-ghaḍabi wa-r-riḍā',
    'feel_angry_5': 'Allāhumma qinī sharra nafsī, wa-a‘zim lī ‘alā arshadi amrī',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"]{2},"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour des adhkars Lost/Angry terminée.")
