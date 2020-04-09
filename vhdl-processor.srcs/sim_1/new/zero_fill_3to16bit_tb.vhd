----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.04.2020 02:06:09
-- Design Name:
-- Module Name: zero_fill_3to16bit_tb - Behavioral
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

entity zero_fill_3to16bit_tb is
end zero_fill_3to16bit_tb;

architecture bench of zero_fill_3to16bit_tb is

  component zero_fill_3to16bit
    port (input : in std_logic_vector (2 downto 0);
          output : out std_logic_vector (15 downto 0));
  end component;

  signal input: std_logic_vector (2 downto 0);
  signal output: std_logic_vector (15 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: zero_fill_3to16bit port map ( input  => input,
                                     output => output );

  stimulus: process
  begin

    -- initialisation code

    input <= "000";

    -- test bench stimulus code

    input <= "000";
    wait for wait_delay;
    input <= "001";
    wait for wait_delay;
    input <= "010";
    wait for wait_delay;
    input <= "011";
    wait for wait_delay;
    input <= "100";
    wait for wait_delay;
    input <= "101";
    wait for wait_delay;
    input <= "110";
    wait for wait_delay;
    input <= "111";
    wait for wait_delay;

    wait;
  end process;


end;
