----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06.02.2020 21:48:14
-- Design Name:
-- Module Name: reg16 - Behavioral
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

entity reg16 is
   port(D : std_logic_vector(15 downto 0);
   load, Clk : in std_logic;
   Q : std_logic_vector(15 downto 0));
end reg16;

architecture Behavioral of reg16 is
begin
   process(Clk)
   begin
      if(rising_edge(Clk)) then
	 if load='1' then
	    Q <= D after 5 ns;
	 end if;
      end if;
   end process;
end Behavioral;
