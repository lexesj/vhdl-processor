import sys


def main():
    lines = sys.stdin.readlines()
    n = len(lines)
    for i, line in zip(range(n), lines):
        formatted = '{0}, -- {1:x}'.format(line.strip(), i)
        print(formatted)
        

if __name__ == "__main__":
    main()
