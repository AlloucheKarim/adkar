import re

with open('lib/core/repository.dart', 'rb') as f:
    content = f.read().decode('utf-8')

pattern = r'phoneticText:\s*""'
matches = list(re.finditer(pattern, content))
for m in matches:
    start = m.start()
    id_pos = content.rfind("id:", 0, start)
    id_line = content[id_pos:id_pos+60].split('\n')[0]
    print(f'Empty phoneticText in: {id_line.strip()}')

print(f'\nTotal: {len(matches)} dhikr(s) with empty phonetic')
