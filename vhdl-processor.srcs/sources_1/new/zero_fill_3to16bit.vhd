----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.04.2020 01:56:21
-- Design Name:
-- Module Name: zero_fill_3to16bit - Behavioral
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

entity zero_fill_3to16bit is
  port (input : in std_logic_vector (2 downto 0);
        output : out std_logic_vector (15 downto 0));
end zero_fill_3to16bit;

architecture Behavioral of zero_fill_3to16bit is
  constant gate_delay: Time := 1 ns;
begin
  output(2 downto 0) <= input after gate_delay;
  output(15 downto 3) <= "0000000000000" after gate_delay;
end Behavioral;
