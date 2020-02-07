----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 06.02.2020 22:02:34
-- Design Name:
-- Module Name: multiplexer2_16bit - Behavioral
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

entity multiplexer2_16bit is
  port(s : in std_logic;
       in1 : in std_logic_vector(15 downto 0);
       in2 : in std_logic_vector(15 downto 0);
       z : out std_logic_vector(15 downto 0));
end multiplexer2_16bit;

architecture Behavioral of multiplexer2_16bit is

begin
  process(s, in1, in2)
  begin
    case s is
      when '0' => z <= in1 after 5 ns;
      when '1' => z <= in2 after 5 ns;
      when others => z <= in1 after 5 ns;
    end case;
  end process;
end Behavioral;
