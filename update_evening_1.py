import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'evening_kursi': 'Allāhu lā ilāha illā huwa al-ḥayyu al-qayyūm, lā ta’khudhuhu sinatun wa-lā nawm, lahu mā fī as-samāwāti wa-mā fī al-arḍ, man dhā alladhī yashfa‘u ‘indahu illā bi-idhnih, ya‘lamu mā bayna aydīhim wa-mā khalfahum, wa-lā yuḥīṭūna bi-shay’in min ‘ilmihi illā bi-mā shā’, wasi‘a kursiyyuhu as-samāwāti wa-l-arḍ, wa-lā ya’ūduhu ḥifẓuhumā wa-huwa al-‘aliyyu al-‘aẓīm',
    'evening_ikhlas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul huwa Allāhu aḥad, Allāhu aṣ-ṣamad, lam yalid wa-lam yūlad, wa-lam yakun lahu kufuwan aḥad',
    'evening_falaq': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi al-falaq, min sharri mā khalaq, wa-min sharri ghāsiqin idhā waqab, wa-min sharri an-naffāthāti fī al-‘uqad, wa-min sharri ḥāsidin idhā ḥasad',
    'evening_nas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi an-nās, maliki an-nās, ilāhi an-nās, min sharri al-waswāsi al-khannās, alladhī yuwaswisu fī ṣudūri an-nās, mina al-jinnati wa-an-nās',
    'evening_1': 'Amsaynā wa-amsā al-mulku lillāh, wa-l-ḥamdu lillāh, lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr. Rabbi as’aluka khayra mā fī hādhīhi al-laylati wa-khayra mā ba‘dahā, wa-a‘ūdhu bika min sharri mā fī hādhīhi al-laylati wa-sharri mā ba‘dahā, rabbi a‘ūdhu bika mina al-kasali wa-sū’i al-kibar, rabbi a‘ūdhu bika min ‘adhābin fī an-nāri wa-‘adhābin fī al-qabr',
    'evening_2': 'Allāhumma bika amsaynā, wa-bika aṣbaḥnā, wa-bika naḥyā, wa-bika namūtu, wa-ilayka al-maṣīr',
    'evening_sayyid': 'Allāhumma anta rabbī lā ilāha illā ant, khalaqtanī wa-anā ‘abduk, wa-anā ‘alā ‘ahdika wa-wa‘dika mā astaṭa‘t, a‘ūdhu bika min sharri mā ṣana‘t, abū’u laka bi-ni‘matika ‘alayy, wa-abū’u bi-dhanbī fa-ghfir lī fa-innahu lā yaghfiru adh-dhunūba illā ant',
    'evening_testimony': 'Allāhumma innī amsaytu ush-hiduka, wa-ush-hidu ḥamalata ‘arshika, wa-malā’ikataka, wa-jamī‘a khalqik, annaka anta Allāhu lā ilāha illā anta waḥdaka lā sharīka lak, wa-anna Muḥammadan ‘abduka wa-rasūluk',
    'evening_shukr': 'Allāhumma mā amsā bī min ni‘matin aw bi-aḥadin min khalqika fa-minka waḥdaka lā sharīka lak, fa-laka al-ḥamdu wa-laka ash-shukr',
    'evening_hasbi': 'Ḥasbiya Allāhu lā ilāha illā huwa ‘alayhi tawakkaltu wa-huwa rabbu al-arshi al-‘aẓīm',
    'evening_aafiyah_2': 'Allāhumma innī as’aluka al-‘afwa wa-l-‘āfiyata fī ad-dunyā wa-l-ākhirah, Allāhumma innī as’aluka al-‘afwa wa-l-‘āfiyata: fī dīnī wa-dunyāya wa-ahlī, wa-mālī, Allāhumma astur ‘awrātī, wa-āmin raw‘ātī, Allāhumma iḥfaẓnī min bayni yadayy, wa-min khalfī, wa-‘an yamīnī, wa-‘an shimālī, wa-min fawqī, wa-a‘ūdhu bi-‘aẓamatika an ughtāla min taḥtī',
    'evening_afiyah': 'Allāhumma ‘āfinī fī badanī, Allāhumma ‘āfinī fī sam‘ī, Allāhumma ‘āfinī fī baṣarī, lā ilāha illā ant. Allāhumma innī a‘ūdhu bika mina al-kufri, wa-l-faqri, wa-a‘ūdhu bika min ‘adhābi al-qabr, lā ilāha illā ant',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"]{2},"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour partielle des adhkars du soir terminée.")
