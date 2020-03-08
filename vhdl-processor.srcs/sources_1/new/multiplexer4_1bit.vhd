----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 01:36:37
-- Design Name:
-- Module Name: multiplexer4_1bit - Behavioral
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

entity multiplexer4_1bit is
   port (S : in std_logic_vector (1 downto 0);
         I : in std_logic_vector (3 downto 0);
         z : out std_logic);
end multiplexer4_1bit;

architecture Behavioral of multiplexer4_1bit is
   component multiplexer2_1bit is
      port(s : in std_logic;
           in1 : in std_logic;
           in2 : in std_logic;
           z : out std_logic);
   end component;

   signal s1,s2 : std_logic;
begin
   mux00 : multiplexer2_1bit port map (
                                          s => S(0),
                                          in1 => I(0),
                                          in2 => I(1),
                                          z => s1
                                      );

   mux01 : multiplexer2_1bit port map (
                                          s => S(0),
                                          in1 => I(2),
                                          in2 => I(3),
                                          z => s2
                                      );

   mux10 : multiplexer2_1bit port map (
                                          s => S(1),
                                          in1 => s1,
                                          in2 => s2,
                                          z => z
                                      );
end Behavioral;
