import re

file_path = r'f:\adkars\lib\core\repository.dart'

transliterations = {
    'leaving_home_1': 'Bismillāh, tawakkaltu ‘alā Allāh, wa-lā ḥawla wa-lā quwwata illā billāh',
    'leaving_home_2': 'Allāhumma innī a‘ūdhu bika an aḍilla aw uḍall, aw azilla aw uzall, aw aẓlima aw uẓlam, aw ajhala aw yujhala ‘alayy',
    'entering_home': 'Allāhumma innī as’aluka khayra al-mawliji wa-khayra al-makhraj, bismillāhi walajnā, wa-bismillāhi kharajnā, wa-‘alā Allāhi rabbinā tawakkalnā',
}

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

for dhikr_id, text in transliterations.items():
    # Force replacement even if not empty to ensure academic style
    pattern = rf"(id:\s*'{dhikr_id}',.*?)phoneticText:\s*['\"].*?['\"],"
    content = re.sub(pattern, rf"\1phoneticText: '{text}',", content, flags=re.DOTALL)

with open(file_path, 'w', encoding='utf-8') as f:
    f.write(content)

print("Mise à jour des adhkars du foyer terminée.")
