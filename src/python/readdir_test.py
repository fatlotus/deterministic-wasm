import os

def main():
    print("--- Readdir Test ---")
    
    try:
        entries = os.listdir("/")
        print("Directory listing for /:")
        for entry in sorted(entries):
            print(f"  {entry}")
    except Exception as e:
        print(f"Failed to read directory: {e}")

if __name__ == "__main__":
    main()
