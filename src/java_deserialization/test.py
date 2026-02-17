# Read, remove all newlines, write to new file
input_file = 'test.txt'
output_file = 'output.txt'

with open(input_file, 'r') as infile:
    content = infile.read()
    cleaned_content = content.replace('\n', '')  # Remove all newlines

with open(output_file, 'w') as outfile:
    outfile.write(cleaned_content)

print(f"File cleaned and saved as {output_file}")