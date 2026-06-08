import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'evening_bismillah': 'Bismillāhi alladhī lā yaḍurru ma‘a ismihi shay’un fī al-arḍi wa-lā fī as-samā’i wa-huwa as-samī‘u al-‘alīm',
    'evening_raditu': 'Raḍītu billāhi rabban, wa-bi-l-islāmi dīnan, wa-bi-Muḥammadin ﷺ nabiyyan',
    'evening_auzu': 'A‘ūdhu bi-kalimāti Allāhi at-tāmmāti min sharri mā khalaq',
    'evening_ya_hayyu': 'Yā Ḥayyu yā Qayyūm bi-raḥmatika astaghīth aṣliḥ lī sha’nī kullahu wa-lā takilnī ilā nafsī ṭarfata ‘ayn',
    'evening_abu_bakr': 'Allāhumma ‘ālimal-ghaybi wash-shahādah, fāṭira as-samāwāti wa-l-arḍ, rabba kulli shay’in wa-malīkah, ash-hadu an lā ilāha illā ant, a‘ūdhu bika min sharri nafsī, wa-min sharri ash-shayṭāni wa-shirkih, wa-an aqtarifa ‘alā nafsī sū’an, aw ajurrahu ilā muslim',
    'evening_fitra': 'Amsaynā ‘alā fiṭrati al-ikhlāṣ, wa-‘alā millati abīnā Ibrāhīm ḥanīfan musliman, wa-mā kāna mina al-mushrikīn',
    'evening_istighfar_grand': 'Astaghfiru Allāha al-‘aẓīm alladhī lā ilāha illā huwa al-ḥayyu al-qayyūmu wa-atūbu ilayh',
    'evening_shirk_protection': 'Allāhumma innī a‘ūdhu bika an ushrika bika shay’an a‘lamuh, wa-astaghfiruka limā lā a‘lamuh',
    'evening_hamm_hazan': 'Allāhumma innī a‘ūdhu bika mina al-hammi wa-l-ḥazan, wa-l-‘ajzi wa-l-kasal, wa-l-jubni wa-l-bukhl, wa-ḍala‘i ad-dayni wa-ghalabati ar-rijāl',
    'evening_salat_alanabi': 'Allāhumma ṣalli wa-sallim ‘alā nabiyyinā Muḥammad',
    'evening_tahlil_100': 'Lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr',
    'evening_tasbih_100': 'Subḥān Allāhi wa bi-ḥamdih',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"]{2},"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour de la section Soir terminée.")
