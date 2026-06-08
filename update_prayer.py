import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'prayer_1': 'Astaghfiru Allāh',
    'prayer_2': 'Allāhumma anta as-salām wa-minka as-salām, tabārakta yā dhā al-jalāli wa-l-ikrām',
    'prayer_3': 'Lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr, Allāhumma lā māni‘a limā a‘ṭayt, wa-lā mu‘ṭiya limā mana‘t, wa-lā yanfa‘u dhā al-jaddi minka al-jadd',
    'prayer_tasbih_subhanallah': 'Subḥān Allāh',
    'prayer_tasbih_alhamdulillah': 'Al-ḥamdu lillāh',
    'prayer_tasbih_allahuakbar': 'Allāhu akbar',
    'prayer_tamam': 'Lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr',
    'prayer_tahlil_fajr_maghrib': 'Lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, yuḥyī wa-yumīt, wa-huwa ‘alā kulli shay’in qadīr',
    'prayer_kursi': 'Allāhu lā ilāha illā huwa al-ḥayyu al-qayyūm, lā ta’khudhuhu sinatun wa-lā nawm, lahu mā fī as-samāwāti wa-mā fī al-arḍ, man dhā alladhī yashfa‘u ‘indahu illā bi-idhnih, ya‘lamu mā bayna aydīhim wa-mā khalfahum, wa-lā yuḥīṭūna bi-shay’in min ‘ilmihi illā bi-mā shā’, wasi‘a kursiyyuhu as-samāwāti wa-l-arḍ, wa-lā ya’ūduhu ḥifẓuhumā wa-huwa al-‘aliyyu al-‘aẓīm',
    'prayer_ikhlas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul huwa Allāhu aḥad, Allāhu aṣ-ṣamad, lam yalid wa-lam yūlad, wa-lam yakun lahu kufuwan aḥad',
    'prayer_falaq': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi al-falaq, min sharri mā khalaq, wa-min sharri ghāsiqin idhā waqab, wa-min sharri an-naffāthāti fī al-‘uqad, wa-min sharri ḥāsidin idhā ḥasad',
    'prayer_nas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi an-nās, maliki an-nās, ilāhi an-nās, min sharri al-waswāsi al-khannās, alladhī yuwaswisu fī ṣudūri an-nās, mina al-jinnati wa-an-nās',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"]{2},"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour des adhkars après la prière terminée.")
