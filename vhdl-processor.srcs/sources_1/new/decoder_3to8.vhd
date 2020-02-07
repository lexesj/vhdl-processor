----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 06.02.2020 21:21:58
-- Design Name:
-- Module Name: decoder_3to8 - Behavioral
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

entity decoder_3to8 is
   port(A : in std_logic_vector(2 downto 0);
	Q : out std_logic_vector(7 downto 0));
end decoder_3to8;

architecture Behavioral of decoder_3to8 is
   constant gate_delay: Time:= 1 ns;
begin
   process(A)
   begin
      case A is
	 when "000" => Q <= "00000001" after gate_delay;
	 when "001" => Q <= "00000010" after gate_delay;
	 when "010" => Q <= "00000100" after gate_delay;
	 when "011" => Q <= "00001000" after gate_delay;
	 when "100" => Q <= "00010000" after gate_delay;
	 when "101" => Q <= "00100000" after gate_delay;
	 when "110" => Q <= "01000000" after gate_delay;
	 when "111" => Q <= "10000000" after gate_delay;
	 when others => Q <= "00000001" after gate_delay;
      end case;
   end process;
end Behavioral;
