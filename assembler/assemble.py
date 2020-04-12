import sys
import re


OPCODE_TABLE = {
    'adi': 0,
    'ld': 1,
    'st': 2,
    'inc': 3,
    'not': 4,
    'add': 5,
    'cmp': 6,
    'b': 7,
    'bc': 8,
    }



def translate(assembly):
    assembly = assembly.strip()
    tokens = assembly.split()
    machine_code = 0
    n = len(tokens)
    if n == 4:
        nums = re.findall(r'\d+', assembly)
        nums = map(int, nums)
        opcode = OPCODE_TABLE[tokens[0].lower()]
        dst = nums[0]
        src1 = nums[1]
        src2 = nums[2]
        machine_code = opcode << 9 | dst << 6 | src1 << 3 | src2
    return machine_code


def main():
    for line in sys.stdin.readlines():
        machine_code = translate(line)
        formatted = 'x\"{:04x}\"'.format(machine_code)
        print(formatted)


if __name__ == "__main__":
    main()
