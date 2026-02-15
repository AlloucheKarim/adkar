import re

file_path = r'f:\adkars\lib\core\repository.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to find Dhikr constructors
dhikr_pattern = r"Dhikr\((.*?)\s{2,}\)"
matches = re.finditer(dhikr_pattern, content, re.DOTALL)

tashkil_range = r"[\u064B-\u0652\u0670\u0653]" # Added \u0653-shadda usually in 0651 but just in case

print("--- Dhikrs in 'feelings' category missing Tashkil ---")
for match in matches:
    dhikr_body = match.group(1)
    
    # Extract ID
    id_match = re.search(r"id:\s+['\"](.*?)['\"]", dhikr_body)
    dhikr_id = id_match.group(1) if id_match else "unknown"
    
    # Extract category
    category_match = re.search(r"category:\s+DhikrCategory\.(\w+)", dhikr_body)
    category = category_match.group(1) if category_match else "unknown"
    
    # Extract virtue - handle multiline and single line
    virtue_match = re.search(r"virtue:\s*(?:['\"]{1,3})(.*?)(?:['\"]{1,3})", dhikr_body, re.DOTALL)
    if virtue_match:
        virtue = virtue_match.group(1).strip()
        
        # Check if Arabic and missing Tashkil
        # We check if it contains Arabic characters [\u0600-\u06FF]
        if re.search(r"[\u0600-\u06FF]", virtue) and not re.search(tashkil_range, virtue):
            if category == "feelings":
                print(f"ID: {dhikr_id} | Category: {category} | Virtue: {virtue}")
    else:
        # Fallback for even more complex cases
        pass

print("\n--- Other Dhikrs missing Tashkil ---")
# Re-run for all categories
matches = re.finditer(dhikr_pattern, content, re.DOTALL)
for match in matches:
    dhikr_body = match.group(1)
    id_match = re.search(r"id:\s+['\"](.*?)['\"]", dhikr_body)
    dhikr_id = id_match.group(1) if id_match else "unknown"
    category_match = re.search(r"category:\s+DhikrCategory\.(\w+)", dhikr_body)
    category = category_match.group(1) if category_match else "unknown"
    virtue_match = re.search(r"virtue:\s*(?:['\"]{1,3})(.*?)(?:['\"]{1,3})", dhikr_body, re.DOTALL)
    if virtue_match and category != "feelings":
        virtue = virtue_match.group(1).strip()
        if re.search(r"[\u0600-\u06FF]", virtue) and not re.search(tashkil_range, virtue):
             print(f"ID: {dhikr_id} | Category: {category} | Virtue: {virtue}")
