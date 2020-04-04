----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04.04.2020 14:20:17
-- Design Name:
-- Module Name: multiplexer9_16bit - Behavioral
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

entity multiplexer9_16bit is
   port(s : in std_logic_vector(3 downto 0);
        in1 : in std_logic_vector(15 downto 0);
        in2 : in std_logic_vector(15 downto 0);
        in3 : in std_logic_vector(15 downto 0);
        in4 : in std_logic_vector(15 downto 0);
        in5 : in std_logic_vector(15 downto 0);
        in6 : in std_logic_vector(15 downto 0);
        in7 : in std_logic_vector(15 downto 0);
        in8 : in std_logic_vector(15 downto 0);
        in9 : in std_logic_vector(15 downto 0);
        z : out std_logic_vector(15 downto 0));
end multiplexer9_16bit;


architecture Behavioral of multiplexer9_16bit is
   constant gate_delay: Time := 1 ns;
begin
   process (s, in1, in2, in3, in4, in5, in6, in7, in8, in9)
   begin
      case s is
         when "0000" => z <= in1 after gate_delay;
         when "0001" => z <= in2 after gate_delay;
         when "0010" => z <= in3 after gate_delay;
         when "0011" => z <= in4 after gate_delay;
         when "0100" => z <= in5 after gate_delay;
         when "0101" => z <= in6 after gate_delay;
         when "0110" => z <= in7 after gate_delay;
         when "0111" => z <= in8 after gate_delay;
         when "1---" => z <= in9 after gate_delay;
         when others => z <= in1 after gate_delay;
      end case;
   end process;
end Behavioral;
