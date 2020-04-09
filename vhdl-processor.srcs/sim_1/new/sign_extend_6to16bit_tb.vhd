----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.04.2020 13:01:06
-- Design Name:
-- Module Name: sign_extend_6to16bit_tb - Behavioral
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

entity sign_extend_6to16bit_tb is
  end sign_extend_6to16bit_tb;

architecture bench of sign_extend_6to16bit_tb is

  component sign_extend_6to16bit
    port (input : in std_logic_vector (5 downto 0);
          output : out std_logic_vector (15 downto 0));
  end component;

  signal input: std_logic_vector (5 downto 0);
  signal output: std_logic_vector (15 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: sign_extend_6to16bit port map ( input  => input,
                                       output => output );

  stimulus: process
  begin

    -- initialisation code

    input <= "000000";

    -- test bench stimulus code

    input <= "000000";
    wait for wait_delay;
    input <= "000001";
    wait for wait_delay;
    input <= "000010";
    wait for wait_delay;
    input <= "000011";
    wait for wait_delay;
    input <= "000100";
    wait for wait_delay;
    input <= "000101";
    wait for wait_delay;
    input <= "000110";
    wait for wait_delay;
    input <= "000111";
    wait for wait_delay;
    input <= "001000";
    wait for wait_delay;
    input <= "001001";
    wait for wait_delay;
    input <= "001010";
    wait for wait_delay;
    input <= "001011";
    wait for wait_delay;
    input <= "001100";
    wait for wait_delay;
    input <= "001101";
    wait for wait_delay;
    input <= "001110";
    wait for wait_delay;
    input <= "001111";
    wait for wait_delay;
    input <= "010000";
    wait for wait_delay;
    input <= "010001";
    wait for wait_delay;
    input <= "010010";
    wait for wait_delay;
    input <= "010011";
    wait for wait_delay;
    input <= "010100";
    wait for wait_delay;
    input <= "010101";
    wait for wait_delay;
    input <= "010110";
    wait for wait_delay;
    input <= "010111";
    wait for wait_delay;
    input <= "011000";
    wait for wait_delay;
    input <= "011001";
    wait for wait_delay;
    input <= "011010";
    wait for wait_delay;
    input <= "011011";
    wait for wait_delay;
    input <= "011100";
    wait for wait_delay;
    input <= "011101";
    wait for wait_delay;
    input <= "011110";
    wait for wait_delay;
    input <= "011111";
    wait for wait_delay;
    input <= "100000";
    wait for wait_delay;
    input <= "100001";
    wait for wait_delay;
    input <= "100010";
    wait for wait_delay;
    input <= "100011";
    wait for wait_delay;
    input <= "100100";
    wait for wait_delay;
    input <= "100101";
    wait for wait_delay;
    input <= "100110";
    wait for wait_delay;
    input <= "100111";
    wait for wait_delay;
    input <= "101000";
    wait for wait_delay;
    input <= "101001";
    wait for wait_delay;
    input <= "101010";
    wait for wait_delay;
    input <= "101011";
    wait for wait_delay;
    input <= "101100";
    wait for wait_delay;
    input <= "101101";
    wait for wait_delay;
    input <= "101110";
    wait for wait_delay;
    input <= "101111";
    wait for wait_delay;
    input <= "110000";
    wait for wait_delay;
    input <= "110001";
    wait for wait_delay;
    input <= "110010";
    wait for wait_delay;
    input <= "110011";
    wait for wait_delay;
    input <= "110100";
    wait for wait_delay;
    input <= "110101";
    wait for wait_delay;
    input <= "110110";
    wait for wait_delay;
    input <= "110111";
    wait for wait_delay;
    input <= "111000";
    wait for wait_delay;
    input <= "111001";
    wait for wait_delay;
    input <= "111010";
    wait for wait_delay;
    input <= "111011";
    wait for wait_delay;
    input <= "111100";
    wait for wait_delay;
    input <= "111101";
    wait for wait_delay;
    input <= "111110";
    wait for wait_delay;
    input <= "111111";
    wait for wait_delay;

    wait;
  end process;


end;
