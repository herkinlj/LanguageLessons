import random
import string

def generate_hard_to_find_pattern(file_name, size_in_mb, key):
    """
    Generate a text file with a specified size in MB that ends with a complex pattern.
    Args:
    - file_name: Name of the file to write.
    - size_in_mb: Size of the file to generate in megabytes.
    - key: The key string that grep will search for, placed at a difficult-to-find location.
    """
    chunk_size = 1024 * 1024  # Write in chunks of 1 MB
    num_chunks = size_in_mb

    # Characters to use in the file (excluding the key characters to avoid false positives)
    chars = ''.join(set(string.printable) - set(key))

    with open(file_name, 'w') as f:
        for _ in range(num_chunks - 1):
            data = ''.join(random.choice(chars) for _ in range(chunk_size))
            f.write(data)
        
        # Generate a complex and nested pattern for the key
        # This will make the 'key' hard to find and process due to being near the file's end
        # and having complex preceding characters
        difficult_pattern = ''.join(random.choice(chars) for _ in range(chunk_size // 2))
        difficult_pattern += 'a' * 10000 + key + 'b' * 10000  # some repeating characters around the key
        f.write(difficult_pattern)

# Parameters for the script
file_name = "test_grep.txt"
size_in_mb = 1024  # For a 1 GB file
key = "specialKEY123"

generate_hard_to_find_pattern(file_name, size_in_mb, key)
