----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 07.02.2020 16:38:17
-- Design Name:
-- Module Name: decoder_3to8_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_3to8_tb is
end decoder_3to8_tb;

architecture bench of decoder_3to8_tb is

  component decoder_3to8
    port(A : in std_logic_vector(2 downto 0);
         Q : out std_logic_vector(7 downto 0));
  end component;

  signal A: std_logic_vector(2 downto 0);
  signal Q: std_logic_vector(7 downto 0);

begin

  uut: decoder_3to8 port map ( A => A,
                               Q => Q );

  stimulus: process
  begin

    -- initialisation code

    A <= "000";

    -- test bench stimulus code

    A <= "000";
    wait for 5 ns;
    A <= "001";
    wait for 5 ns;
    A <= "010";
    wait for 5 ns;
    A <= "011";
    wait for 5 ns;
    A <= "100";
    wait for 5 ns;
    A <= "101";
    wait for 5 ns;
    A <= "110";
    wait for 5 ns;
    A <= "111";

  end process;


end;
