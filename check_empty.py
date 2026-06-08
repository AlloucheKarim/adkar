import re

file_path = r'f:\adkars\lib\core\repository.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# On cherche les blocs Dhikr et on extrait l'id si phoneticText est vide
matches = re.finditer(rf"id:\s*'([^']*)',.*?phoneticText:\s*['\"]{{2}},", content, flags=re.DOTALL)

empty_ids = [m.group(1) for m in matches]

if empty_ids:
    print("IDs avec phoneticText vide :")
    for eid in empty_ids:
        print(f"- {eid}")
else:
    print("Tous les adhkars ont une translittération !")
