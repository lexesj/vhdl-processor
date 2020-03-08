----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 00:58:21
-- Design Name:
-- Module Name: arithmetic_circuit_16bit_tb - Behavioral
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
-- any Ailinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity arithmetic_circuit_16bit_tb is
end arithmetic_circuit_16bit_tb;

architecture bench of arithmetic_circuit_16bit_tb is

  component arithmetic_circuit_16bit
     port (c_in : in std_logic;
           c_out : out std_logic;
           A : in std_logic_vector (15 downto 0);
           B : in std_logic_vector (15 downto 0);
           S : in std_logic_vector (1 downto 0);
           G : out std_logic_vector (15 downto 0));
  end component;

  signal c_in: std_logic;
  signal c_out: std_logic;
  signal A: std_logic_vector (15 downto 0);
  signal B: std_logic_vector (15 downto 0);
  signal S: std_logic_vector (1 downto 0);
  signal G: std_logic_vector (15 downto 0);

  constant wait_delay: time := 50 ns;

begin

  uut: arithmetic_circuit_16bit port map ( c_in  => c_in,
                                           c_out => c_out,
                                           A     => A,
                                           B     => B,
                                           S     => S,
                                           G     => G );

  stimulus: process
  begin

    -- initialisation code

    c_in <= '0';
    A <= x"0000";
    B <= x"ffff";
    S <= "00";

    -- test bench stimulus code


    -- G = A
    S <= "00";
    c_in <= '0';
    A <= x"aaaa";
    wait for wait_delay;

    -- G = A + B
    S <= "01";
    -- -1 + -1 + 0 = -2
    c_in <= '0';
    A <= x"ffff";
    B <= x"ffff";
    wait for wait_delay;
    -- -1 + 10 + 0 = 9
    c_in <= '0';
    A <= x"ffff";
    B <= x"000a";
    wait for wait_delay;
    -- -1 + 1 + 0 = 0
    c_in <= '0';
    A <= x"ffff";
    B <= x"0001";
    wait for wait_delay;
    -- 0 + -1 + 0 = -1
    c_in <= '0';
    A <= x"0000";
    B <= x"ffff";
    wait for wait_delay;
    -- 0x1234 + 0x1234 + 0 = 0x2468
    -- 4660 + 4660 + 0 = 9320
    c_in <= '0';
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;
    -- 0x8000 + 0x7fff + 0 = 0xffff
    -- -32768 + 32767 + 0 = -1
    c_in <= '0';
    A <= x"8000";
    B <= x"7fff";
    wait for wait_delay;

    -- G = A + ~B
    S <= "10";
    -- -1 + ~-1 + 0 = -1
    c_in <= '0';
    A <= x"ffff";
    B <= x"ffff";
    wait for wait_delay;
    -- -1 + ~10 + 0 = -12
    c_in <= '0';
    A <= x"ffff";
    B <= x"000a";
    wait for wait_delay;
    -- -1 + ~1 + 0 = -3
    c_in <= '0';
    A <= x"ffff";
    B <= x"0001";
    wait for wait_delay;
    -- 0 + ~-1 + 0 = 0
    c_in <= '0';
    A <= x"0000";
    B <= x"ffff";
    wait for wait_delay;
    -- 0x1234 + ~0x1234 + 0 = 0xffff
    -- 4660 + ~4660 + 0 = -1
    c_in <= '0';
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;
    -- 0x8000 + ~0x7fff + 0 = 0
    -- -32768 + ~32767 + 0 = 0
    c_in <= '0';
    A <= x"8000";
    B <= x"7fff";
    wait for wait_delay;

    -- G = A - 1
    S <= "11";
    c_in <= '0';
    A <= x"aaaa";
    wait for wait_delay;

    -- G = A + 1
    S <= "00";
    c_in <= '1';
    A <= x"aaaa";
    wait for wait_delay;

    -- G = A + B + 1
    S <= "01";
    -- -1 + -1 + 1 = -1
    c_in <= '1';
    A <= x"ffff";
    B <= x"ffff";
    wait for wait_delay;
    -- -1 + 10 + 1 = 10
    c_in <= '1';
    A <= x"ffff";
    B <= x"000a";
    wait for wait_delay;
    -- -1 + 1 + 1 = 1
    c_in <= '1';
    A <= x"ffff";
    B <= x"0001";
    wait for wait_delay;
    -- 0 + -1 + 1 = 0
    c_in <= '1';
    A <= x"0000";
    B <= x"ffff";
    wait for wait_delay;
    -- 0x1234 + 0x1234 + 1 = 0x2469
    -- 4660 + 4660 + 1 = 9321
    c_in <= '1';
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;
    -- 0x8000 + 0x7fff + 1 = 0x0
    -- -32768 + 32767 + 1 = 0
    c_in <= '1';
    A <= x"8000";
    B <= x"7fff";
    wait for wait_delay;

    -- G = A + ~B + 1
    S <= "10";
    -- -1 + ~-1 + 1 = 0
    c_in <= '1';
    A <= x"ffff";
    B <= x"ffff";
    wait for wait_delay;
    -- -1 + ~10 + 1 = -11
    c_in <= '1';
    A <= x"ffff";
    B <= x"000a";
    wait for wait_delay;
    -- -1 + ~1 + 1 = -2
    c_in <= '1';
    A <= x"ffff";
    B <= x"0001";
    wait for wait_delay;
    -- 0 + ~-1 + 1 = 1
    c_in <= '1';
    A <= x"0000";
    B <= x"ffff";
    wait for wait_delay;
    -- 0x1234 + ~0x1234 + 1 = 0x0
    -- 4660 + ~4660 + 1 = 0
    c_in <= '1';
    A <= x"1234";
    B <= x"1234";
    wait for wait_delay;
    -- 0x8000 + ~0x7fff + 1 = 1
    -- -32768 + ~32767 + 1 = 1
    c_in <= '1';
    A <= x"8000";
    B <= x"7fff";
    wait for wait_delay;

    -- G = A - 1 + 1
    S <= "11";
    c_in <= '1';
    A <= x"aaaa";
    wait for wait_delay;

    wait;
  end process;


end;
