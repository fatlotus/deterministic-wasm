import os

def main():
    # Read random bytes from the system random number generator (WASI random_get)
    random_bytes = os.urandom(5)
    
    print("Random numbers:")
    for byte in random_bytes:
        print(byte % 100)

if __name__ == "__main__":
    main()
