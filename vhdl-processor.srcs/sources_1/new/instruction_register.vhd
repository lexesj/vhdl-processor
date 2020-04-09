----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.04.2020 16:49:35
-- Design Name:
-- Module Name: instruction_register - Behavioral
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

entity instruction_register is
  port (clock : in std_logic;
        instruction_load : in std_logic;
        input : in std_logic_vector (15 downto 0);
        opcode : out std_logic_vector (7 downto 0);
        dest_reg : out std_logic_vector (2 downto 0);
        sel_a : out std_logic_vector (2 downto 0);
        sel_b : out std_logic_vector (2 downto 0));
end instruction_register;

architecture Behavioral of instruction_register is
  constant gate_delay: Time := 1 ns;
begin
  process(clock)
  begin
    if(rising_edge(clock)) then
      if instruction_load='1' then
        sel_b <= input(2 downto 0) after gate_delay;
        sel_a <= input(5 downto 3) after gate_delay;
        dest_reg <= input(8 downto 6) after gate_delay;
        opcode <= '0' & input (15 downto 9) after gate_delay;
      end if;
    end if;
  end process;
end Behavioral;
