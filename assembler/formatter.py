import sys


def main():
    lines = sys.stdin.readlines()
    for i, line in enumerate(lines):
        machine_code = int(line.strip(), 16)
        opcode = (machine_code & (0x7f << 9)) >> 9
        destination_register = (machine_code & (0b111 << 6)) >> 6
        source_a = (machine_code & (0b111 << 3)) >> 3
        source_b = machine_code & 0b111
        formatted = 'b"{0:07b}_{1:03b}_{2:03b}_{3:03b}", -- {4:x}'.format(
            opcode, destination_register, source_a, source_b, i)
        print(formatted)


if __name__ == "__main__":
    main()
