import sys
import re
import numpy as np

OPCODE_TABLE = {
    'adi': 0,
    'ld': 1,
    'st': 2,
    'inc': 3,
    'not': 4,
    'add': 5,
    'b': 6,
    'bne': 0b111,
    'nop': 8,
    'sr': 9,
    'dec': 10,
    }


def translate(assembly):
    assembly = assembly.strip()
    tokens = assembly.split()
    machine_code = 0
    n = len(tokens)
    opcode = OPCODE_TABLE[tokens[0].lower()]
    nums = re.findall(r'-?\d+', assembly)
    nums = list(map(int, nums))
    opcode_token = tokens[0]
    dst = 0
    src1 = 0
    src2 = 0
    if n == 4:
        dst = nums[0]
        src1 = nums[1]
        src2 = nums[2]
        machine_code = opcode << 9 | dst << 6 | src1 << 3 | src2
    elif opcode_token == 'ld' or opcode_token == 'inc' or opcode_token \
        == 'not' or opcode_token == 'dec':
        dst = nums[0]
        src1 = nums[1]
    elif opcode_token == 'st':
        src1 = nums[0]
        src2 = nums[1]
    elif opcode_token == 'sr':
        dst = nums[0]
        src2 = nums[1]
    elif opcode_token == 'b' or opcode_token == 'bne':
        mask = 0b111
        displacement = nums[0]
        displacement_left = np.right_shift(displacement & mask << 3, 3)
        displacement_right = displacement & mask
        dst = displacement_left
        if len(nums) == 2:
            src1 = nums[1]
        src2 = displacement_right
    machine_code = opcode << 9 | dst << 6 | src1 << 3 | src2
    return machine_code


def main():
    for line in sys.stdin.readlines():
        machine_code = translate(line)
        formatted = 'x"{0:04x}"'.format(machine_code)
        print(formatted)


if __name__ == '__main__':
    main()
