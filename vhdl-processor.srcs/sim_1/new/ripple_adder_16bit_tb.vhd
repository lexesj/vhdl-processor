----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07.03.2020 22:59:04
-- Design Name:
-- Module Name: ripple_adder_16bit_tb - Behavioral
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

entity ripple_adder_16bit_tb is
end ripple_adder_16bit_tb;

architecture bench of ripple_adder_16bit_tb is

  component ripple_adder_16bit
     port (c_in : in std_logic;
           c_out : out std_logic;
           X : in std_logic_vector (15 downto 0);
           Y : in std_logic_vector (15 downto 0);
           G : out std_logic_vector (15 downto 0));
  end component;

  signal c_in: std_logic;
  signal c_out: std_logic;
  signal X: std_logic_vector (15 downto 0);
  signal Y: std_logic_vector (15 downto 0);
  signal G: std_logic_vector (15 downto 0);
  constant wait_delay: time := 50 ns;

begin

  uut: ripple_adder_16bit port map ( c_in  => c_in,
                                     c_out => c_out,
                                     X     => X,
                                     Y     => Y,
                                     G     => G );

  stimulus: process
  begin

    -- initialisation code

    c_in <= '0';
    X <= x"0000";
    Y <= x"0000";

    -- test bench stimulus code

    -- 0 + 0 + 0 = 0
    c_in <= '0';
    X <= x"0000";
    Y <= x"0000";
    wait for wait_delay;
    -- -1 + -1 + 0 = -2
    c_in <= '0';
    X <= x"ffff";
    Y <= x"ffff";
    wait for wait_delay;
    -- -1 + 10 + 0 = 9
    c_in <= '0';
    X <= x"ffff";
    Y <= x"000a";
    wait for wait_delay;
    -- -1 + 1 + 0 = 0
    c_in <= '0';
    X <= x"ffff";
    Y <= x"0001";
    wait for wait_delay;
    -- 0 + -1 + 0 = -1
    c_in <= '0';
    X <= x"0000";
    Y <= x"ffff";
    wait for wait_delay;
    -- 0x1234 + 0x1234 + 0 = 0x2468
    -- 4660 + 4660 + 0 = 9320
    c_in <= '0';
    X <= x"1234";
    Y <= x"1234";
    wait for wait_delay;
    -- 0x8000 + 0x7fff + 0 = 0xffff
    -- -32768 + 32767 + 0 = -1
    c_in <= '0';
    X <= x"8000";
    Y <= x"7fff";
    wait for wait_delay;

    -- 0 + 0 + 1 = 1
    c_in <= '1';
    X <= x"0000";
    Y <= x"0000";
    wait for wait_delay;
    -- -1 + -1 + 1 = -1
    c_in <= '1';
    X <= x"ffff";
    Y <= x"ffff";
    wait for wait_delay;
    -- -1 + 10 + 1 = 10
    c_in <= '1';
    X <= x"ffff";
    Y <= x"000a";
    wait for wait_delay;
    -- -1 + 1 + 1 = 1
    c_in <= '1';
    X <= x"ffff";
    Y <= x"0001";
    wait for wait_delay;
    -- 0 + -1 + 1 = 0
    c_in <= '1';
    X <= x"0000";
    Y <= x"ffff";
    wait for wait_delay;
    -- 0x1234 + 0x1234 + 1 = 0x2469
    -- 4660 + 4660 + 1 = 9321
    c_in <= '1';
    X <= x"1234";
    Y <= x"1234";
    wait for wait_delay;
    -- 0x8000 + 0x7fff + 1 = 0
    -- -32768 + 32767 + 1 = 0
    c_in <= '1';
    X <= x"8000";
    Y <= x"7fff";
    wait for wait_delay;

    wait;
  end process;


end;
