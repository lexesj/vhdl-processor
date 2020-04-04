----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02.04.2020 17:44:32
-- Design Name:
-- Module Name: decoder_4to9_tb - Behavioral
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

entity decoder_4to9_tb is
--  Port ( );
end decoder_4to9_tb;

architecture bench of decoder_4to9_tb is

  component decoder_4to9
     port(A : in std_logic_vector(3 downto 0);
          Q : out std_logic_vector(8 downto 0));
  end component;

  signal A: std_logic_vector(3 downto 0);
  signal Q: std_logic_vector(8 downto 0);

  constant wait_delay: time := 5 ns;
begin

  uut: decoder_4to9 port map ( A => A,
                               Q => Q );

  stimulus: process
  begin

    -- initialisation code

    A <= x"0";

    -- test bench stimulus code

    A <= x"0";
    wait for wait_delay;
    A <= x"1";
    wait for wait_delay;
    A <= x"2";
    wait for wait_delay;
    A <= x"3";
    wait for wait_delay;
    A <= x"4";
    wait for wait_delay;
    A <= x"5";
    wait for wait_delay;
    A <= x"6";
    wait for wait_delay;
    A <= x"7";
    wait for wait_delay;
    A <= x"8";
    wait for wait_delay;
    A <= x"9";
    wait for wait_delay;
    A <= x"A";
    wait for wait_delay;
    A <= x"B";
    wait for wait_delay;
    A <= x"C";
    wait for wait_delay;
    A <= x"D";
    wait for wait_delay;
    A <= x"E";
    wait for wait_delay;
    A <= x"F";
    wait for wait_delay;

    wait;
  end process;


end;
