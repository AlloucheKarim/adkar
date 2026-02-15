import re

file_path = r'f:\adkars\lib\core\repository.dart'

with open(file_path, 'r', encoding='utf-8') as f:
    content = f.read()

# Pattern to find Dhikr constructors more reliably
dhikr_blocks = re.findall(r"Dhikr\((.*?)\s{2,}\)", content, re.DOTALL)

tashkil_range = r"[\u064B-\u0652\u0670\u0651]"

print("Line | ID | Field | Missing Tashkil Text")
print("-" * 60)

for block in dhikr_blocks:
    if "emotionTag" in block:
        id_match = re.search(r"id:\s+['\"](.*?)['\"]", block)
        dhikr_id = id_match.group(1) if id_match else "unknown"
        
        # Check virtue
        virtue_match = re.search(r"virtue:\s*(?:['\"]{1,3})(.*?)(?:['\"]{1,3})", block, re.DOTALL)
        if virtue_match:
            virtue = virtue_match.group(1).strip()
            if virtue and not re.search(tashkil_range, virtue):
                print(f"--- | {dhikr_id:20} | virtue | {virtue}")
        
        # Check sourceText
        source_match = re.search(r"sourceText:\s*(?:['\"]{1,3})(.*?)(?:['\"]{1,3})", block, re.DOTALL)
        if source_match:
            source = source_match.group(1).strip()
            if source and not re.search(tashkil_range, source):
                print(f"--- | {dhikr_id:20} | sourceText | {source}")
