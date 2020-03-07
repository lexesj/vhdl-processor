----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07.03.2020 21:00:45
-- Design Name:
-- Module Name: full_adder - Behavioral
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

entity full_adder is
  port(in1 : in std_logic;
       in2 : in std_logic;
       c_in : in std_logic;
       c_out : out std_logic;
       sum : out std_logic);
end full_adder;

architecture Behavioral of full_adder is
  constant gate_delay: Time := 1 ns;
  signal s1,s2,s3 : std_logic;
begin
  s1 <= (in1 xor in2) after gate_delay;
  s2 <= (s1 and c_in) after gate_delay;
  s3 <= (in1 and in2) after gate_delay;
  sum <= (s1 xor c_in) after gate_delay;
  c_out <= (s2 or s3) after gate_delay;
end Behavioral;
