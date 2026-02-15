import re

file_path = r'f:\adkars\lib\core\repository.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    lines = f.readlines()

current_id = ""
current_category = ""
print("Line | ID | Category | Virtue")
print("-" * 50)

for i, line in enumerate(lines):
    # Find ID
    id_match = re.search(r"id:\s+['\"](.*?)['\"]", line)
    if id_match:
        current_id = id_match.group(1)
    
    # Find Category
    cat_match = re.search(r"category:\s+DhikrCategory\.(\w+)", line)
    if cat_match:
        current_category = cat_match.group(1)
        
    # Find Virtue
    virtue_match = re.search(r"virtue:\s*(?:['\"]{1,3})(.*?)(?:['\"]{1,3})", line)
    if not virtue_match:
        # Check if it started on this line but didn't finish
        if "virtue:" in line:
            # Look at next line
            next_line = lines[i+1] if i+1 < len(lines) else ""
            virtue_match = re.search(r"['\"]{1,3}(.*?)['\"]{1,3}", next_line)
            if virtue_match:
                virtue = virtue_match.group(1).strip()
                print(f"{i+2:4} | {current_id:20} | {current_category:10} | {virtue}")
    else:
        virtue = virtue_match.group(1).strip()
        print(f"{i+1:4} | {current_id:20} | {current_category:10} | {virtue}")
