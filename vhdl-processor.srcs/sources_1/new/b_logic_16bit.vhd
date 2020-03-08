----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 00:20:31
-- Design Name:
-- Module Name: b_logic_16bit - Behavioral
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

entity b_logic_16bit is
   port (B : in std_logic_vector (15 downto 0);
         S : in std_logic_vector (1 downto 0);
         output : out std_logic_vector (15 downto 0));
end b_logic_16bit;

architecture Behavioral of b_logic_16bit is
   component multiplexer2_1bit is
      port(s : in std_logic;
           in1 : in std_logic;
           in2 : in std_logic;
           z : out std_logic);
   end component;
begin
   mux0000 : multiplexer2_1bit port map (
                                          s => B(0),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(0)
                                        );

   mux0001 : multiplexer2_1bit port map (
                                          s => B(1),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(1)
                                        );

   mux0010 : multiplexer2_1bit port map (
                                          s => B(2),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(2)
                                        );

   mux0011 : multiplexer2_1bit port map (
                                          s => B(3),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(3)
                                        );

   mux0100 : multiplexer2_1bit port map (
                                          s => B(4),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(4)
                                        );

   mux0101 : multiplexer2_1bit port map (
                                          s => B(5),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(5)
                                        );

   mux0110 : multiplexer2_1bit port map (
                                          s => B(6),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(6)
                                        );

   mux0111 : multiplexer2_1bit port map (
                                          s => B(7),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(7)
                                        );

   mux1000 : multiplexer2_1bit port map (
                                          s => B(8),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(8)
                                        );

   mux1001 : multiplexer2_1bit port map (
                                          s => B(9),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(9)
                                        );

   mux1010 : multiplexer2_1bit port map (
                                          s => B(10),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(10)
                                        );

   mux1011 : multiplexer2_1bit port map (
                                          s => B(11),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(11)
                                        );

   mux1100 : multiplexer2_1bit port map (
                                          s => B(12),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(12)
                                        );

   mux1101 : multiplexer2_1bit port map (
                                          s => B(13),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(13)
                                        );

   mux1110 : multiplexer2_1bit port map (
                                          s => B(14),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(14)
                                        );

   mux1111 : multiplexer2_1bit port map (
                                          s => B(15),
                                          in1 => S(1),
                                          in2 => S(0),
                                          z => output(15)
                                        );

end Behavioral;
