----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 02.04.2020 17:39:17
-- Design Name:
-- Module Name: decoder_4to9 - Behavioral
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

entity decoder_4to9 is
   port(A : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(8 downto 0));
end decoder_4to9;


architecture Behavioral of decoder_4to9 is
   constant gate_delay: Time:= 1 ns;
begin
   process(A)
   begin
      case A is
         when "0000" => Q <= "000000001" after gate_delay;
         when "0001" => Q <= "000000010" after gate_delay;
         when "0010" => Q <= "000000100" after gate_delay;
         when "0011" => Q <= "000001000" after gate_delay;
         when "0100" => Q <= "000010000" after gate_delay;
         when "0101" => Q <= "000100000" after gate_delay;
         when "0110" => Q <= "001000000" after gate_delay;
         when "0111" => Q <= "010000000" after gate_delay;
         when "1---" => Q <= "100000000" after gate_delay;
         when others => Q <= "000000000" after gate_delay;
      end case;
   end process;
end Behavioral;
