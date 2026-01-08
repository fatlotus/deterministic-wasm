import os

def main():
    user = os.environ.get("USER")
    if user:
        print(f"USER={user}")
    else:
        print("USER not set")

if __name__ == "__main__":
    main()
