import re

file_path = r'f:\adkars\lib\core\repository.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to match Dhikr constructors
dhikr_pattern = r"Dhikr\((.*?)\)"
matches = re.finditer(dhikr_pattern, content, re.DOTALL)

tashkil_range = r"[\u064B-\u0652\u0670]"

for match in matches:
    dhikr_body = match.group(1)
    
    # Check if it's in the feelings category
    if "DhikrCategory.feelings" in dhikr_body:
        # Extract virtue
        virtue_match = re.search(r"virtue:\s+['\"](.*?)['\"]", dhikr_body)
        if virtue_match:
            virtue = virtue_match.group(1)
            # Check if it has NO tashkil
            if not re.search(tashkil_range, virtue):
                # Get ID
                id_match = re.search(r"id:\s+['\"](.*?)['\"]", dhikr_body)
                dhikr_id = id_match.group(1) if id_match else "unknown"
                print(f"ID: {dhikr_id} | Virtue (Missing Tashkil): {virtue}")
        else:
            # Check if it's a multi-line virtue or using a constant
            pass

# Also check others just in case
print("\nChecking other categories for missing Tashkil in virtues:")
for match in re.finditer(dhikr_pattern, content, re.DOTALL):
    dhikr_body = match.group(1)
    if "DhikrCategory.feelings" not in dhikr_body:
        virtue_match = re.search(r"virtue:\s+['\"](.*?)['\"]", dhikr_body)
        if virtue_match:
            virtue = virtue_match.group(1)
            if virtue and not re.search(tashkil_range, virtue):
                id_match = re.search(r"id:\s+['\"](.*?)['\"]", dhikr_body)
                dhikr_id = id_match.group(1) if id_match else "unknown"
                print(f"ID: {dhikr_id} | Virtue (Missing Tashkil): {virtue}")
