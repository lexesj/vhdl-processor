----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 06.02.2020 22:00:01
-- Design Name:
-- Module Name: multiplexer8_16bit - Behavioral
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

entity multiplexer8_16bit is
   port(s : in std_logic_vector(2 downto 0);
        in1 : in std_logic_vector(15 downto 0);
        in2 : in std_logic_vector(15 downto 0);
        in3 : in std_logic_vector(15 downto 0);
        in4 : in std_logic_vector(15 downto 0);
        in5 : in std_logic_vector(15 downto 0);
        in6 : in std_logic_vector(15 downto 0);
        in7 : in std_logic_vector(15 downto 0);
        in8 : in std_logic_vector(15 downto 0);
        z : out std_logic_vector(15 downto 0));
end multiplexer8_16bit;

architecture Behavioral of multiplexer8_16bit is

begin
   process (s, in1, in2, in3, in4, in5, in6, in7, in8)
   begin
      case s is
         when "000" => z <= in1 after 5 ns;
         when "001" => z <= in2 after 5 ns;
         when "010" => z <= in3 after 5 ns;
         when "011" => z <= in4 after 5 ns;
         when "100" => z <= in5 after 5 ns;
         when "101" => z <= in6 after 5 ns;
         when "110" => z <= in7 after 5 ns;
         when "111" => z <= in8 after 5 ns;
      end case;
   end process;
end Behavioral;
