----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 16:37:56
-- Design Name:
-- Module Name: datapath_16bit_tb - Behavioral
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

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datapath_16bit_tb is
end datapath_16bit_tb;

architecture bench of datapath_16bit_tb is

  component datapath_16bit
     port (read_write : in std_logic;
           mux_d : in std_logic;
           function_select : in std_logic_vector (4 downto 0);
           mux_b : in std_logic;
           b_addr : in std_logic_vector (3 downto 0);
           a_addr : in std_logic_vector (3 downto 0);
           dest_addr : in std_logic_vector (3 downto 0);
           data_in : in std_logic_vector (15 downto 0);
           const_in : in std_logic_vector (15 downto 0);
           clock : in std_logic;
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic;
           addr_out : out std_logic_vector (15 downto 0);
           data_out : out std_logic_vector (15 downto 0));
  end component;

  signal read_write: std_logic;
  signal mux_d: std_logic;
  signal function_select: std_logic_vector (4 downto 0);
  signal mux_b: std_logic;
  signal b_addr: std_logic_vector (3 downto 0);
  signal a_addr: std_logic_vector (3 downto 0);
  signal dest_addr: std_logic_vector (3 downto 0);
  signal data_in: std_logic_vector (15 downto 0);
  signal const_in: std_logic_vector (15 downto 0);
  signal clock: std_logic;
  signal V: std_logic;
  signal C: std_logic;
  signal N: std_logic;
  signal Z: std_logic;
  signal addr_out: std_logic_vector (15 downto 0);
  signal data_out: std_logic_vector (15 downto 0);

  constant wait_delay: time := 50 ns;
  constant clock_period: time := 50 ns;
  signal stop_the_clock: boolean;

  signal control_word: std_logic_vector (19 downto 0);
begin

  read_write <= control_word(0);
  mux_d <= control_word(1);
  function_select <= control_word(6 downto 2);
  mux_b <= control_word(7);
  b_addr <= control_word(11 downto 8);
  a_addr <= control_word(15 downto 12);
  dest_addr <= control_word(19 downto 16);

  uut: datapath_16bit port map ( read_write      => read_write,
                                 mux_d           => mux_d,
                                 function_select => function_select,
                                 mux_b           => mux_b,
                                 b_addr          => b_addr,
                                 a_addr          => a_addr,
                                 dest_addr       => dest_addr,
                                 data_in         => data_in,
                                 const_in        => const_in,
                                 clock           => clock,
                                 V               => V,
                                 C               => C,
                                 N               => N,
                                 Z               => Z,
                                 addr_out        => addr_out,
                                 data_out        => data_out );

  stimulus: process
  begin

    -- initialisation code

    control_word <= b"0000_0000_0000_0_00000_0_0";
    data_in <= x"0000";
    const_in <= x"0000";
    wait for wait_delay;

    -- test bench stimulus code

    -- result = 3x + 3 + 3
    -- mov r1, #5         ; x = 5
    control_word <= b"0001_0000_0000_0_00000_1_1";
    data_in <= x"0005";
    wait for wait_delay;
    -- mov r2, #6         ; y = 6
    control_word <= b"0010_0000_0000_0_00000_1_1";
    data_in <= x"0006";
    wait for wait_delay;
    -- mov r3, #2         ; z = 2
    control_word <= b"0011_0000_0000_0_00000_1_1";
    data_in <= x"0002";
    wait for wait_delay;
    -- add r0, r1, r1     ; result = x + x
    control_word <= b"0000_0001_0001_0_00010_0_1";
    wait for wait_delay;
    -- mov r4, #3         ; temp = 3
    control_word <= b"0100_0000_0000_0_00000_1_1";
    data_in <= x"0003";
    wait for wait_delay;
    -- add r0, r4, r0     ; result += 3
    control_word <= b"0000_0100_0000_0_00010_0_1";
    wait for wait_delay;
    -- add r4, r1, r4     ; temp += x
    control_word <= b"0100_0001_0100_0_00010_0_1";
    wait for wait_delay;
    -- add r0, r0, r4     ; result += temp
    -- should be 21
    control_word <= b"0000_0000_0100_0_00010_0_1";
    wait for wait_delay;

    -- result = 64x + 8y - 16z
    -- mov r0,r1, lsl #1  ; result = 2x
    control_word <= b"0000_0000_0001_0_11000_0_1";
    wait for wait_delay;
    -- mov r0,r0, lsl #1  ; result = 4x
    control_word <= b"0000_0000_0000_0_11000_0_1";
    wait for wait_delay;
    -- mov r0,r0, lsl #1  ; result = 8x
    control_word <= b"0000_0000_0000_0_11000_0_1";
    wait for wait_delay;
    -- mov r0,r0, lsl #1  ; result = 16x
    control_word <= b"0000_0000_0000_0_11000_0_1";
    wait for wait_delay;
    -- mov r0,r0, lsl #1  ; result = 32x
    control_word <= b"0000_0000_0000_0_11000_0_1";
    wait for wait_delay;
    -- mov r0,r0, lsl #1  ; result = 64x
    control_word <= b"0000_0000_0000_0_11000_0_1";
    wait for wait_delay;
    -- mov r4,r2, lsl #1  ; temp = 2y
    control_word <= b"0100_0000_0010_0_11000_0_1";
    wait for wait_delay;
    -- mov r4,r4, lsl #1  ; temp = 4y
    control_word <= b"0100_0000_0100_0_11000_0_1";
    wait for wait_delay;
    -- mov r4,r4, lsl #1  ; temp = 8y
    control_word <= b"0100_0000_0100_0_11000_0_1";
    wait for wait_delay;
    -- add r0,r0,r4       ; result = 64x + 8y
    control_word <= b"0000_0000_0100_0_00010_0_1";
    wait for wait_delay;
    -- mov r4,r3, lsl #1  ; temp = 2z
    control_word <= b"0100_0000_0011_0_11000_0_1";
    wait for wait_delay;
    -- mov r4,r4, lsl #1  ; temp = 4z
    control_word <= b"0100_0000_0100_0_11000_0_1";
    wait for wait_delay;
    -- mov r4,r4, lsl #1  ; temp = 8z
    control_word <= b"0100_0000_0100_0_11000_0_1";
    wait for wait_delay;
    -- mov r4,r4, lsl #1  ; temp = 16z
    control_word <= b"0100_0000_0100_0_11000_0_1";
    wait for wait_delay;
    -- sub r0,r0,r4       ; result = 64x + 8y - 16z
    -- should be 336
    control_word <= b"0000_0000_0100_0_00101_0_1";
    wait for wait_delay;
    -- sub r0, #255       ; result -= 255
    control_word <= b"0000_0000_0000_1_00101_0_1";
    const_in <= x"00ff";
    -- sub r0, #255       ; result -= 255
    wait for wait_delay;
    control_word <= b"0000_0000_0000_1_00101_0_1";
    const_in <= x"00ff";
    wait for wait_delay;

    -- result = 3x + 3 + 3
    -- mov r1, #5         ; x = 5
    control_word <= b"0001_0000_0000_0_00000_1_1";
    data_in <= x"0005";
    stop_the_clock <= true;
    wait for wait_delay;


    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
