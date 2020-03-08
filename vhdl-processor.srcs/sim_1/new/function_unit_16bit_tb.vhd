----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 05:16:35
-- Design Name:
-- Module Name: function_unit_16bit_tb - Behavioral
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

entity function_unit_16bit_tb is
end function_unit_16bit_tb;

architecture bench of function_unit_16bit_tb is

  component function_unit_16bit
     port (A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           F : out std_logic_vector (15 downto 0);
           H_sel : in std_logic_vector (1 downto 0);
           G_sel : in std_logic_vector (3 downto 0);
           MF_sel : in std_logic;
           V : out std_logic;
           C : out std_logic;
           N : out std_logic;
           Z : out std_logic);
  end component;

  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal F: std_logic_vector (15 downto 0);
  signal H_sel: std_logic_vector (1 downto 0);
  signal G_sel: std_logic_vector (3 downto 0);
  signal MF_sel: std_logic;
  signal V: std_logic;
  signal C: std_logic;
  signal N: std_logic;
  signal Z: std_logic;

  signal FS: std_logic_vector (4 downto 0);
  constant wait_delay: time := 50 ns;
begin

  G_sel(0) <= FS(0);
  G_sel(1) <= FS(1);
  G_sel(2) <= FS(2);
  G_sel(3) <= FS(3);
  MF_sel <= FS(4);
  H_sel(0) <= FS(2);
  H_sel(1) <= FS(3);

  uut: function_unit_16bit port map ( A      => A,
                                      B      => B,
                                      F      => F,
                                      H_sel  => H_sel,
                                      G_sel  => G_sel,
                                      MF_sel => MF_sel,
                                      V      => V,
                                      C      => C,
                                      N      => N,
                                      Z      => Z );

  stimulus: process
  begin

    -- initialisation code

    A <= x"0000";
    B <= x"0000";
    FS <= "00000";

    -- test bench stimulus code

    -- test zero flag
    FS <= "00000";
    A <= x"0000";
    B <= x"0000";
    wait for wait_delay;
    -- test overflow flag
    FS <= "00010";
    A <= x"7fff";
    B <= x"7fff";
    wait for wait_delay;
    -- test carry flag
    FS <= "00010";
    A <= x"ffff";
    B <= x"0001";
    wait for wait_delay;
    -- test negative flag
    FS <= "00000";
    A <= x"ffff";
    wait for wait_delay;

    -- G = A
    FS <= "00000";
    A <= x"aaaa";
    wait for wait_delay;

    -- G = A + 1
    FS <= "00001";
    A <= x"aaaa";
    wait for wait_delay;

    -- G = A + B
    FS <= "00010";
    -- 0x1234 + 0x1234 + 0 = 0x2468
    -- 4660 + 4660 + 0 = 9320
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;
    -- 0x8000 + 0x7fff + 0 = 0xffff
    -- -32768 + 32767 + 0 = -1
    A <= x"8000";
    B <= x"7fff";
    wait for wait_delay;

    -- G = A + B + 1
    FS <= "00011";
    -- 0x1234 + 0x1234 + 1 = 0x2469
    -- 4660 + 4660 + 1 = 9321
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;

    -- G = A + ~B
    FS <= "00100";
    -- 0x1234 + ~0x1234 + 0 = 0xffff
    -- 4660 + ~4660 + 0 = -1
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;
    -- 0x8000 + ~0x7fff + 0 = 0
    -- -32768 + ~32767 + 0 = 0
    A <= x"8000";
    B <= x"7fff";
    wait for wait_delay;

    -- G = A + ~B + 1 (A - B)
    -- G = 0x54ab
    FS <= "00101";
    A <= x"aaaa";
    B <= x"55ff";
    wait for wait_delay;

    -- G = A - 1
    FS <= "00110";
    A <= x"aaaa";
    wait for wait_delay;

    -- G = A
    FS <= "00111";
    A <= x"afaf";
    wait for wait_delay;

    -- G = A and B
    -- G = 0xaa
    FS <= "01000";
    A <= x"aaaa";
    B <= x"55ff";
    wait for wait_delay;
    -- G = A or B
    -- G = 0xffff
    FS <= "01010";
    wait for wait_delay;
    -- G = A xor B
    -- G = 0xff55
    FS <= "01100";
    wait for wait_delay;
    -- G = ~A
    -- G = 0x5555
    FS <= "01110";
    wait for wait_delay;

    -- G = B
    -- G = 0x55ff
    FS <= "10000";
    wait for wait_delay;
    -- G = B >> 1
    -- G = 0x2aff
    FS <= "10100";
    wait for wait_delay;
    -- G = B << 1
    -- G = 0xabfe
    FS <= "11000";
    wait for wait_delay;

    wait;
  end process;


end;
