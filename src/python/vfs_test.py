def main():
    print("--- VFS Test ---")
    
    files_to_test = ["/test.txt", "test.txt", "./test.txt"]
    
    for path in files_to_test:
        print(f"Testing path: {path}")
        try:
            with open(path, 'r') as file:
                line = file.readline().rstrip('\n')
                if line:
                    print(f"Successfully read: {line}")
                else:
                    print("File is empty or could not read line.")
        except Exception:
            print(f"Failed to open {path}")

if __name__ == "__main__":
    main()
