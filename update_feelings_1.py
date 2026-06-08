import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'feel_happy_1': 'Al-ḥamdu lillāhi alladhī bi-ni‘matihi tatimmu aṣ-ṣāliḥāt',
    'feel_happy_2': 'Rabbi awzi‘nī an ashkura ni‘mataka allatī an‘amta ‘alayya wa-‘alā wālidayya wa-an a‘mala ṣāliḥan tarḍāh',
    'feel_happy_3': 'Allāhumma a‘innī ‘alā dhikrika, wa-shukrika, wa-ḥusni ‘ibādatik',
    'feel_happy_4': 'Mā shā’a Allāhu lā quwwata illā billāh',
    'feel_happy_5': 'Al-ḥamdu lillāhi ḥamdan kathīran ṭayyiban mubārakan fīh',
    'tired_tasbih_subhanallah': 'Subḥān Allāh',
    'tired_tasbih_alhamdulillah': 'Al-ḥamdu lillāh',
    'tired_tasbih_allahuakbar': 'Allāhu akbar',
    'feel_tired_2': 'Allāhumma ‘āfinī fī badanī, Allāhumma ‘āfinī fī sam‘ī, Allāhumma ‘āfinī fī baṣarī, lā ilāha illā ant',
    'feel_tired_3': 'Lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr',
    'feel_tired_4': 'Allāhumma bārik lī fī waqtī wa-juhdī',
    'feel_tired_5': 'Astaghfiru Allāha al-‘aẓīm alladhī lā ilāha illā huwa al-ḥayyu al-qayyūmu wa-atūbu ilayh',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"]{2},"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour des adhkars Happy/Tired terminée.")
