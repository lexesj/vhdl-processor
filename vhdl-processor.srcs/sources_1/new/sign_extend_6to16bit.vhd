----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.04.2020 12:50:56
-- Design Name:
-- Module Name: sign_extend_6to16bit - Behavioral
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

entity sign_extend_6to16bit is
  port (input : in std_logic_vector (5 downto 0);
        output : out std_logic_vector (15 downto 0));
end sign_extend_6to16bit;

architecture Behavioral of sign_extend_6to16bit is
  constant gate_delay: Time:= 1 ns;
begin
  process(input)
  begin
    case input is
      when "0-----" => output <= x"00" & "00" & input after gate_delay;
      when "1-----" => output <= x"ff" & "11" & input after gate_delay;
      when others => output <= x"0000" after gate_delay;
    end case;
  end process;
end Behavioral;
