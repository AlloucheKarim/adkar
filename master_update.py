import re

file_path = r'f:\adkars\lib\core\repository.dart'

# Compilation de TOUTES les translittérations
all_transliterations = {
    # MORNING
    'morning_kursi': 'Allāhu lā ilāha illā huwa al-ḥayyu al-qayyūm, lā ta’khudhuhu sinatun wa-lā nawm, lahu mā fī as-samāwāti wa-mā fī al-arḍ, man dhā alladhī yashfa‘u ‘indahu illā bi-idhnih, ya‘lamu mā bayna aydīhim wa-mā khalfahum, wa-lā yuḥīṭūna bi-shay’in min ‘ilmihi illā bi-mā shā’, wasi‘a kursiyyuhu as-samāwāti wa-l-arḍ, wa-lā ya’ūduhu ḥifẓuhumā wa-huwa al-‘aliyyu al-‘aẓīm',
    'morning_ikhlas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul huwa Allāhu aḥad, Allāhu aṣ-ṣamad, lam yalid wa-lam yūlad, wa-lam yakun lahu kufuwan aḥad',
    'morning_falaq': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi al-falaq, min sharri mā khalaq, wa-min sharri ghāsiqin idhā waqab, wa-min sharri an-naffāthāti fī al-‘uqad, wa-min sharri ḥāsidin idhā ḥasad',
    'morning_nas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi an-nās, maliki an-nās, ilāhi an-nās, min sharri al-waswāsi al-khannās, alladhī yuwaswisu fī ṣudūri an-nās, mina al-jinnati wa-an-nās',
    'morning_1': 'Aṣbaḥnā wa-aṣbaḥa al-mulku lillāh, wa-l-ḥamdu lillāh, lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr. Rabbi as’aluka khayra mā fī hādhā al-yawmi wa-khayra mā ba‘dahu, wa-a‘ūdhu bika min sharri mā fī hādhā al-yawmi wa-sharri mā ba‘dahu, rabbi a‘ūdhu bika mina al-kasali wa-sū’i al-kibar, rabbi a‘ūdhu bika min ‘adhābin fī an-nāri wa-‘adhābin fī al-qabr',
    'morning_2': 'Allāhumma bika aṣbaḥnā, wa-bika amsaynā, wa-bika naḥyā, wa-bika namūtu, wa-ilayka an-nushūr',
    'morning_sayyid': 'Allāhumma anta rabbī lā ilāha illā ant, khalaqtanī wa-anā ‘abduk, wa-anā ‘alā ‘ahdika wa-wa‘dika mā astaṭa‘t, a‘ūdhu bika min sharri mā ṣana‘t, abū’u laka bi-ni‘matika ‘alayy, wa-abū’u bi-dhanbī fa-ghfir lī fa-innahu lā gaghfiru adh-dhunūba illā ant',
    'morning_testimony': 'Allāhumma innī aṣbaḥtu ush-hiduka, wa-ush-hidu ḥamalata ‘arshika, wa-malā’ikataka, wa-jamī‘a khalqik, annaka anta Allāhu lā ilāha illā anta waḥdaka lā sharīka lak, wa-anna Muḥammadan ‘abduka wa-rasūluk',
    'morning_shukr': 'Allāhumma mā aṣbaḥa bī min ni‘matin aw bi-aḥadin min khalqika fa-minka waḥdaka lā sharīka lak, fa-laka al-ḥamdu wa-laka ash-shukr',
    'morning_hasbi': 'Ḥasbiya Allāhu lā ilāha illā huwa ‘alayhi tawakkaltu wa-huwa rabbu al-arshi al-‘aẓīm',
    'morning_aafiyah_2': 'Allāhumma innī as’aluka al-‘afwa wa-l-‘āfiyata fī ad-dunyā wa-l-ākhirah, Allāhumma innī as’aluka al-‘afwa wa-l-‘āfiyata fī dīnī wa-dunyāya wa-ahlī wa-mālī, Allāhumma astur ‘awrātī wa-āmin raw‘ātī, Allāhumma iḥfaẓnī min bayni yadayy wa-min khalfī wa-‘an yamīnī wa-‘an shimālī wa-min fawqī, wa-a‘ūdhu bi-caẓamatika an ughtāla min taḥtī',
    'morning_afiyah': 'Allāhumma ‘āfinī fī badanī, Allāhumma ‘āfinī fī sam‘ī, Allāhumma ‘āfinī fī baṣarī, lā ilāha illā ant. Allāhumma innī a‘ūdhu bika mina al-kufri wa-l-faqri, wa-a‘ūdhu bika min ‘adhābi al-qabr, lā ilāha illā ant',
    'morning_bismillah': 'Bismillāhi alladhī lā yaḍurru ma‘a ismihi shay’un fī al-arḍi wa-lā fī as-samā’i wa-huwa as-samī‘u al-‘alīm',
    'morning_raditu': 'Raḍītu billāhi rabban, wa-bi-l-islāmi dīnan, wa-bi-Muḥammadin ﷺ nabiyyan',
    'morning_ya_hayyu': 'Yā Ḥayyu yā Qayyūm bi-raḥmatika astaghīth aṣliḥ lī sha’nī kullahu wa-lā takilnī ilā nafsī ṭarfata ‘ayn',
    'morning_abu_bakr': 'Allāhumma ‘ālimal-ghaybi wash-shahādah, fāṭira as-samāwāti wa-l-arḍ, rabba kulli shay’in wa-malīkah, ash-hadu an lā ilāha illā ant, a‘ūdhu bika min sharri nafsī, wa-min sharri ash-shayṭāni wa-shirkih, wa-an aqtarifa ‘alā nafsī sū’an, aw ajurrahu ilā muslim',
    'morning_fitra': 'Aṣbaḥnā ‘alā fiṭrati al-islām, wa-‘alā kalimatil ikhlāṣ, wa-‘alā dīni nabiyyinā Muḥammadin ﷺ, wa-‘alā millati abīnā Ibrāhīm, ḥanīfan musliman wa-mā kāna mina al-mushrikīn',
    'morning_subhan': 'Subḥān Allāhi wa-bi-ḥamdih, ‘adada khalqih, wa-riḍā nafsih, wa-zinata ‘arshih, wa-midāda kalimātih',
    'morning_istighfar_grand': 'Astaghfiru Allāha al-‘aẓīm alladhī lā ilāha illā huwa al-ḥayyu al-qayyūmu wa-atūbu ilayh',
    'morning_shirk_protection': 'Allāhumma innī a‘ūdhu bika an ushrika bika shay’an a‘lamuh, wa-astaghfiruka limā lā a‘lamuh',
    'morning_ilman_nafian': 'Allāhumma innī as’aluka ‘ilman nāfi‘an, wa-rizqan ṭayyiban, wa-‘amalan mutaqabbalan',
    'morning_hamm_hazan': 'Allāhumma innī a‘ūdhu bika mina al-hammi wa-l-ḥazan, wa-l-‘ajzi wa-l-kasal, wa-l-jubni wa-l-bukhl, wa-ḍala‘i ad-dayni wa-ghalabati ar-rijāl',
    'morning_salat_alanabi': 'Allāhumma ṣalli wa-sallim ‘alā nabiyyinā Muḥammad',
    'morning_tahlil_100': 'Lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr',
    'morning_astaghfir': 'Astaghfiru Allāha wa-atūbu ilayh',

    # EVENING
    'evening_kursi': 'Allāhu lā ilāha illā huwa al-ḥayyu al-qayyūm, lā ta’khudhuhu sinatun wa-lā nawm, lahu mā fī as-samāwāti wa-mā fī al-arḍ, man dhā alladhī yashfa‘u ‘indahu illā bi-idhnih, ya‘lamu mā bayna aydīhim wa-mā khalfahum, wa-lā yuḥīṭūna bi-shay’in min ‘ilmihi illā bi-mā shā’, wasi‘a kursiyyuhu as-samāwāti wa-l-arḍ, wa-lā ya’ūduhu ḥifẓuhumā wa-huwa al-‘aliyyu al-‘aẓīm',
    'evening_ikhlas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul huwa Allāhu aḥad, Allāhu aṣ-ṣamad, lam yalid wa-lam yūlad, wa-lam yakun lahu kufuwan aḥad',
    'evening_falaq': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi al-falaq, min sharri mā khalaq, wa-min sharri ghāsiqin idhā waqab, wa-min sharri an-naffāthāti fī al-‘uqad, wa-min sharri ḥāsidin idhā ḥasad',
    'evening_nas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi an-nās, maliki an-nās, ilāhi an-nās, min sharri al-waswāsi al-khannās, alladhī yuwaswisu fī ṣudūri an-nās, mina al-jinnati wa-an-nās',
    'evening_1': 'Amsaynā wa-amsā al-mulku lillāh, wa-l-ḥamdu lillāh, lā ilāha illā Allāh waḥdahu lā sharīka lah, lahu al-mulku wa-lahu al-ḥamdu, wa-huwa ‘alā kulli shay’in qadīr. Rabbi as’aluka khayra mā fī hādhīhi al-laylati wa-khayra mā ba‘dahā, wa-a‘ūdhu bika min sharri mā fī hādhīhi al-laylati wa-sharri mā ba‘dahā, rabbi a‘ūdhu bika mina al-kasali wa-sū’i al-kibar, rabbi a‘ūdhu bika min ‘adhābin fī an-nāri wa-‘adhābin fī al-qabr',
    'evening_2': 'Allāhumma bika amsaynā, wa-bika aṣbaḥnā, wa-bika naḥyā, wa-bika namūtu, wa-ilayka al-maṣīr',
    'evening_sayyid': 'Allāhumma anta rabbī lā ilāha illā ant, khalaqtanī wa-anā ‘abduk, wa-anā ‘alā ‘ahdika wa-wa‘dika mā astaṭa‘t, a‘ūdhu bika min sharri mā ṣana‘t, abū’u laka bi-ni‘matika ‘alayy, wa-abū’u bi-dhanbī fa-ghfir lī fa-innahu lā gaghfiru adh-dhunūba illā ant',
    'evening_testimony': 'Allāhumma innī amsaytu ush-hiduka, wa-ush-hidu ḥamalata ‘arshika, wa-malā’ikataka, wa-jamī‘a khalqik, annaka anta Allāhu lā ilāha illā anta waḥdaka lā sharīka lak, wa-anna Muḥammadan ‘abduka wa-rasūluk',
    'evening_shukr': 'Allāhumma mā amsā bī min ni‘matin aw bi-aḥadin min khalqika fa-minka waḥdaka lā sharīka lak, fa-laka al-ḥamdu wa-laka ash-shukr',
    'evening_hasbi': 'Ḥasbiya Allāhu lā ilāha illā huwa ‘alayhi tawakkaltu wa-huwa rabbu al-arshi al-‘aẓīm',
    'evening_aafiyah_2': 'Allāhumma innī as’aluka al-‘afwa wa-l-‘āfiyata fī ad-dunyā wa-l-ākhirah, Allāhumma innī as’aluka al-‘afwa wa-l-‘āfiyata fī dīnī wa-dunyāya wa-ahlī wa-mālī, Allāhumma astur ‘awrātī wa-āmin raw‘ātī, Allāhumma iḥfaẓnī min bayni yadayy wa-min khalfī wa-‘an yamīnī wa-‘an shimālī wa-min fawqī, wa-a‘ūdhu bi-caẓamatika an ughtāla min taḥtī',
    'evening_afiyah': 'Allāhumma ‘āfinī fī badanī, Allāhumma ‘āfinī fī sam‘ī, Allāhumma ‘āfinī fī baṣarī, lā ilāha illā ant. Allāhumma innī a‘ūdhu bika mina al-kufri wa-l-faqri, wa-a‘ūdhu bika min ‘adhābi al-qabr, lā ilāha illā ant',
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

    # SLEEP
    'sleep_ikhlas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul huwa Allāhu aḥad, Allāhu aṣ-ṣamad, lam yalid wa-lam yūlad, wa-lam yakun lahu kufuwan aḥad',
    'sleep_falaq': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi al-falaq, min sharri mā khalaq, wa-min sharri ghāsiqin idhā waqab, wa-min sharri an-naffāthāti fī al-‘uqad, wa-min sharri ḥāsidin idhā ḥasad',
    'sleep_nas': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul a‘ūdhu bi-rabbi an-nās, maliki an-nās, ilāhi an-nās, min sharri al-waswāsi al-khannās, alladhī yuwaswisu fī ṣudūri an-nās, mina al-jinnati wa-an-nās',
    'sleep_kursi': 'Allāhu lā ilāha illā huwa al-ḥayyu al-qayyūm, lā ta’khudhuhu sinatun wa-lā nawm, lahu mā fī as-samāwāti wa-mā fī al-arḍ, man dhā alladhī yashfa‘u ‘indahu illā bi-idhnih, ya‘lamu mā bayna aydīhim wa-mā khalfahum, wa-lā yuḥīṭūna bi-shay’in min ‘ilmihi illā bi-mā shā’, wasi‘a kursiyyuhu as-samāwāti wa-l-arḍ, wa-lā ya’ūduhu ḥifẓuhumā wa-huwa al-‘aliyyu al-‘aẓīm',
    'sleep_aslamtu': 'Allāhumma aslamtu nafsī ilayk, wa-fawwaḍtu amrī ilayk, wa-wajjahtu wajhī ilayk, wa-alja’tu ẓahrī ilayk, raghbatan wa-rahbatan ilayk, lā malja’a wa-lā manjā minka illā ilayk, āmantu bi-kitābika alladhī anzalt, wa-bi-nabiyyika alladhī arsalt',
    'sleep_1': 'Bismika rabbī waḍa‘tu janbī, wa-bika arfa‘uh, fa-in amsakta nafsī fa-rḥam-hā, wa-in arsaltahā fa-ḥfaẓ-hā bi-mā taḥfaẓu bihi ‘ibādaka aṣ-ṣāliḥīn',
    'sleep_baqarah': 'Āmana ar-rasūlu bi-mā unzila ilayhi min rabbihi wa-l-mu’minūn. Kullun āmana billāhi wa-malā’ikatihi wa-kutubihi wa-rusulih, lā nufarriqu bayna aḥadin min rusulih, wa-qālū sami‘nā wa-aṭa‘nā, ghufrānaka rabbanā wa-ilayka al-maṣīr. Lā yukallifu Allāhu nafsan illā wus‘ahā, lahā mā kasabat wa-‘alayhā mā aktasabat. Rabbanā lā tu’ākhidhnā in nasīnā aw akhṭa’nā, rabbanā wa-lā taḥmil ‘alaynā iṣran kamā ḥamaltahu ‘alā alladhīna min qablinā, rabbanā wa-lā tuḥammilnā mā lā ṭāqata lanā bih, wa-fu ‘annā wa-ghfir lanā wa-rḥamnā, anta mawlānā fa-nṣurnā ‘alā al-qawmi al-kāfirīn',
    'sleep_qini': 'Allāhumma qinī ‘adhābaka yawma tab‘athu ‘ibādak',
    'sleep_tasbih_subhanallah': 'Subḥān Allāh',
    'sleep_tasbih_alhamdulillah': 'Al-ḥamdu lillāh',
    'sleep_tasbih_allahuakbar': 'Allāhu akbar',
    'sleep_kafirun': 'Bismi-llāhi ar-raḥmāni ar-raḥīm. Qul yā ayyuhā al-kāfirūn, lā a‘budu mā ta‘budūn, wa-lā antum ‘ābidūna mā a‘bud, wa-lā anā ‘ābidun mā ‘abadtum, wa-lā antum ‘ābidūna mā a‘bud, lakum dīnukum wa-liya dīn',

    # WAKING UP
    'waking_1': 'Al-ḥamdu lillāhi alladhī aḥyānā ba‘da mā amātanā wa-ilayhi an-nushūr',
    'waking_2': 'Al-ḥamdu lillāhi alladhī ‘āfānī fī jasadī, wa-radda ‘alayya rūḥī, wa-adhina lī bi-dhikrih',

    # AFTER PRAYER
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

    # FEELINGS
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

    # HOME
    'leaving_home_1': 'Bismillāh, tawakkaltu ‘alā Allāh, wa-lā ḥawla wa-lā quwwata illā billāh',
    'leaving_home_2': 'Allāhumma innī a‘ūdhu bika an aḍilla aw uḍall, aw azilla aw uzall, aw aẓlima aw uẓlam, aw ajhala aw yujhala ‘alayy',
    'entering_home': 'Allāhumma innī as’aluka khayra al-mawliji wa-khayra al-makhraj, bismillāhi walajnā, wa-bismillāhi kharajnā, wa-‘alā Allāhi rabbinā tawakkalnā',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# On itère sur chaque bloc Dhikr(...)
# Pour chaque bloc, on cherche l'id et on remplace phoneticText
def replace_phonetic(match):
    block = match.group(0)
    id_match = re.search(r"id:\s*'([^']*)'", block)
    if id_match:
        dhikr_id = id_match.group(1)
        if dhikr_id in all_transliterations:
            text = all_transliterations[dhikr_id]
            # On remplace le champ phoneticText propre à ce bloc
            new_block = re.sub(r"phoneticText:\s*['\"].*?['\"],", f"phoneticText: '{text}',", block)
            return new_block
    return block

# Recherche de tous les blocs Dhikr(...)
new_content = re.sub(r"Dhikr\(.*?\),", replace_phonetic, content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(new_content)

print(f"Mise à jour globale terminée. {len(all_transliterations)} adhkars traités.")
