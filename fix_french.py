with open('lib/core/repository.dart', 'rb') as f:
    content = f.read()

# Find the frenchText section for morning_1
idx = content.find(b'Nous sommes au matin')
if idx == -1:
    print('NOT FOUND')
else:
    # Find the enclosing quote character before "Nous"
    quote_start = idx - 1
    opening_quote = content[quote_start:idx]
    print(f'Opening quote byte: {opening_quote}')
    
    # Find the closing quote
    end_idx = content.find(b"',\r\n      phoneticText", idx)
    if end_idx == -1:
        end_idx = content.find(b"',\n      phoneticText", idx)
    
    print(f'Start: {idx}, End: {end_idx}')
    print(f'Current text snippet: {content[quote_start:end_idx+2]}')
    
    # The frenchText is enclosed in single quotes. Replace with double quotes.
    old_segment = content[quote_start:end_idx+1]
    # Replace opening ' with " and closing ' with "
    new_segment = b'"' + content[idx:end_idx] + b'"'
    
    new_content = content[:quote_start] + new_segment + content[end_idx+1:]
    
    with open('lib/core/repository.dart', 'wb') as f:
        f.write(new_content)
    print('DONE! File updated.')
