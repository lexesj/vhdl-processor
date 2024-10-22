----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 22:23:00
-- Design Name: 
-- Module Name: control_memory256x28bits - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_memory256x28bits is
  port(mem_write : out std_logic;
       mux_m : out std_logic;
       read_write : out std_logic;
       mux_d : out std_logic;
       function_select : out std_logic_vector(4 downto 0);
       mux_b : out std_logic;
       temp_b : out std_logic;
       temp_a : out std_logic;
       temp_d : out std_logic;
       pc_load : out std_logic;
       pc_increment : out std_logic;
       instruction_load : out std_logic;
       mux_c : out std_logic;
       mux_s : out std_logic_vector(2 downto 0);
       next_address : out std_logic_vector(7 downto 0);
       in_car : in std_logic_vector(7 downto 0));
end control_memory256x28bits;

architecture Behavioral of control_memory256x28bits is
  type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
begin
  memory_m: process(in_car)
    variable control_mem : mem_array := (

      --|-----+----+-+-+-+-+-+-+-+-+-----+-+-+-+-|
      --|NXT  | MS |M|I|P|P|T|T|T|M|FS   |M|R|M|M|
      --|ADD  |    |C|L|I|L|D|A|B|B|     |D|W|M|W|
      --|-----+----+-+-+-+-+-+-+-+-+-----+-+-+-+-|

      -- 0
      x"c0" & b"001_0_0_0_0_0_0_0_1_00010_0_1_0_0", -- 0 - adi dr sa const_b
      x"c0" & b"001_0_0_0_0_0_0_0_0_00000_1_1_0_0", -- 1 - ld dr [sa]
      x"c0" & b"001_0_0_0_0_0_0_0_0_00000_0_0_0_1", -- 2 - st [sa] sb
      x"c0" & b"001_0_0_0_0_0_0_0_0_00001_0_1_0_0", -- 3 - inc dr sa
      x"c0" & b"001_0_0_0_0_0_0_0_0_01110_0_1_0_0", -- 4 - not dr sa
      x"c0" & b"001_0_0_0_0_0_0_0_0_00010_0_1_0_0", -- 5 - add dr sa sb
      x"c0" & b"001_0_0_0_1_0_0_0_0_00000_0_0_0_0", -- 6 - b displacement
      x"06" & b"111_0_0_0_0_0_0_0_0_00000_0_0_0_0", -- 7 - bne displacement sb 
      x"c0" & b"001_0_0_0_0_0_0_0_0_00000_0_0_0_0", -- 8 - nop
      x"c0" & b"001_0_0_0_0_0_0_0_0_10100_0_1_0_0", -- 9 - sr dr sb
      x"c0" & b"001_0_0_0_0_0_0_0_0_00110_0_1_0_0", -- a - dec dr sa
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 1
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 2
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 3
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 4
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 5
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 6
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 7
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 8
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- 9
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- a
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- b
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f

      --|-----+----+-+-+-+-+-+-+-+-+-----+-+-+-+-|
      --|NXT  | MS |M|I|P|P|T|T|T|M|FS   |M|R|M|M|
      --|ADD  |    |C|L|I|L|D|A|B|B|     |D|W|M|W|
      --|-----+----+-+-+-+-+-+-+-+-+-----+-+-+-+-|

      -- c
      x"c1" & b"000_0_1_1_0_0_0_0_0_00000_0_0_1_0", -- 0 - if
      x"00" & b"001_1_0_0_0_0_0_0_0_00000_0_0_0_0", -- 1 - exo
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- d
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- e
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000", -- f
      -- f
      x"0000000", -- 0
      x"0000000", -- 1
      x"0000000", -- 2
      x"0000000", -- 3
      x"0000000", -- 4
      x"0000000", -- 5
      x"0000000", -- 6
      x"0000000", -- 7
      x"0000000", -- 8
      x"0000000", -- 9
      x"0000000", -- a
      x"0000000", -- b
      x"0000000", -- c
      x"0000000", -- d
      x"0000000", -- e
      x"0000000"  -- f
    );
    variable addr: integer;
    variable control_out: std_logic_vector(27 downto 0);
  begin
    addr := conv_integer(in_car);
    control_out := control_mem(addr);
    mem_write <= control_out(0);
    mux_m <= control_out(1);
    read_write <= control_out(2);
    mux_d <= control_out(3);
    function_select <= control_out(8 downto 4);
    mux_b <= control_out(9);
    temp_b <= control_out(10);
    temp_a <= control_out(11);
    temp_d <= control_out(12);
    pc_load <= control_out(13);
    pc_increment <= control_out(14);
    instruction_load <= control_out(15);
    mux_c <= control_out(16);
    mux_s <= control_out(19 downto 17);
    next_address <= control_out(27 downto 20);
  end process;
end Behavioral;
