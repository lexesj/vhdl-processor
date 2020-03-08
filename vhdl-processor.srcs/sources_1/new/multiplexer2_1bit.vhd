----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 00:06:05
-- Design Name:
-- Module Name: multiplexer2_1bit - Behavioral
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

entity multiplexer2_1bit is
  port(s : in std_logic;
       in1 : in std_logic;
       in2 : in std_logic;
       z : out std_logic);
end multiplexer2_1bit;

architecture Behavioral of multiplexer2_1bit is
   signal s1,s2 : std_logic;
  constant gate_delay: Time := 1 ns;
begin
   s1 <= (in1 and not s) after gate_delay;
   s2 <= (in2 and s) after gate_delay;
   z <= (s1 xor s2) after gate_delay;
end Behavioral;
