----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 03:00:21
-- Design Name:
-- Module Name: ALU_16bit_tb - Behavioral
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

entity ALU_16bit_tb is
end ALU_16bit_tb;

architecture bench of ALU_16bit_tb is

  component ALU_16bit
     port (A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           c_in : in std_logic;
           S : in std_logic_vector (2 downto 0);
           G : out std_logic_vector (15 downto 0);
           c_out : out std_logic);
  end component;

  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal c_in: std_logic;
  signal S: std_logic_vector (2 downto 0);
  signal G: std_logic_vector (15 downto 0);
  signal c_out: std_logic;

  constant wait_delay: time := 50 ns;
begin

  uut: ALU_16bit port map ( A     => A,
                            B     => B,
                            c_in  => c_in,
                            S     => S,
                            G     => G,
                            c_out => c_out );

  stimulus: process
  begin

    -- initialisation code

    A <= x"aaaa";
    B <= x"55ff";
    S <= "000";
    c_in <= '0';

    -- test bench stimulus code

    -- G = A
    -- G = 0xaaaa
    S <= "000";
    c_in <= '0';
    wait for wait_delay;
    -- G = A + 1
    -- G = 0xaaab
    S <= "000";
    c_in <= '1';
    wait for wait_delay;
    -- G = A + B
    -- G = 0xa9
    S <= "001";
    c_in <= '0';
    wait for wait_delay;
    -- G = A + B + 1
    -- G = 0xaa
    S <= "001";
    c_in <= '1';
    wait for wait_delay;
    -- G = A + ~B
    -- G = 0x54aa
    S <= "010";
    c_in <= '0';
    wait for wait_delay;
    -- G = A + ~B + 1 (A - B)
    -- G = 0x54ab
    S <= "010";
    c_in <= '1';
    wait for wait_delay;
    -- G = A - 1
    -- G = 0xaaa9
    S <= "011";
    c_in <= '0';
    wait for wait_delay;
    -- G = A
    -- G = 0xaaaa
    S <= "011";
    c_in <= '1';
    wait for wait_delay;
    -- G = A and B
    -- G = 0xaa
    S <= "100";
    wait for wait_delay;
    -- G = A or B
    -- G = 0xffff
    S <= "101";
    wait for wait_delay;
    -- G = A xor B
    -- G = 0xff55
    S <= "110";
    wait for wait_delay;
    -- G = ~A
    -- G = 0x5555
    S <= "111";
    wait for wait_delay;

    wait;
  end process;


end;
