import sys

def main():
    if len(sys.argv) > 0:
        print(f"argv[0] = {sys.argv[0]}")
    else:
        print("No arguments")

if __name__ == "__main__":
    main()
