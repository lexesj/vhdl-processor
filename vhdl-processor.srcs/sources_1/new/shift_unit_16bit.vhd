----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 03:48:20
-- Design Name:
-- Module Name: shift_unit_16bit - Behavioral
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

entity shift_unit_16bit is
   port (B : in std_logic_vector (15 downto 0);
         I : in std_logic_vector (1 downto 0);
         S : in std_logic_vector (1 downto 0);
         H : out std_logic_vector (15 downto 0));
end shift_unit_16bit;

architecture Behavioral of shift_unit_16bit is
   component multiplexer4_1bit is
      port (S : in std_logic_vector (1 downto 0);
            I : in std_logic_vector (3 downto 0);
            z : out std_logic);
   end component;

   signal undef: std_logic;
begin
   undef <= '0';

   mux0000 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(0),
                                          I(1) => B(1),
                                          I(2) => I(0),
                                          I(3) => undef,
                                          z => H(0)
                                        );
   mux0001 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(1),
                                          I(1) => B(2),
                                          I(2) => B(0),
                                          I(3) => undef,
                                          z => H(1)
                                        );
   mux0010 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(2),
                                          I(1) => B(3),
                                          I(2) => B(1),
                                          I(3) => undef,
                                          z => H(2)
                                        );
   mux0011 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(3),
                                          I(1) => B(4),
                                          I(2) => B(2),
                                          I(3) => undef,
                                          z => H(3)
                                        );
   mux0100 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(4),
                                          I(1) => B(5),
                                          I(2) => B(3),
                                          I(3) => undef,
                                          z => H(4)
                                        );
   mux0101 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(5),
                                          I(1) => B(6),
                                          I(2) => B(4),
                                          I(3) => undef,
                                          z => H(5)
                                        );
   mux0110 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(6),
                                          I(1) => B(7),
                                          I(2) => B(5),
                                          I(3) => undef,
                                          z => H(6)
                                        );
   mux0111 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(7),
                                          I(1) => B(8),
                                          I(2) => B(6),
                                          I(3) => undef,
                                          z => H(7)
                                        );
   mux1000 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(8),
                                          I(1) => B(9),
                                          I(2) => B(7),
                                          I(3) => undef,
                                          z => H(8)
                                        );
   mux1001 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(9),
                                          I(1) => B(10),
                                          I(2) => B(8),
                                          I(3) => undef,
                                          z => H(9)
                                        );
   mux1010 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(10),
                                          I(1) => B(11),
                                          I(2) => B(9),
                                          I(3) => undef,
                                          z => H(10)
                                        );
   mux1011 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(11),
                                          I(1) => B(12),
                                          I(2) => B(10),
                                          I(3) => undef,
                                          z => H(11)
                                        );
   mux1100 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(12),
                                          I(1) => B(13),
                                          I(2) => B(11),
                                          I(3) => undef,
                                          z => H(12)
                                        );
   mux1101 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(13),
                                          I(1) => B(14),
                                          I(2) => B(12),
                                          I(3) => undef,
                                          z => H(13)
                                        );
   mux1110 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(14),
                                          I(1) => B(15),
                                          I(2) => B(13),
                                          I(3) => undef,
                                          z => H(14)
                                        );
   mux1111 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => B(15),
                                          I(1) => I(1),
                                          I(2) => B(14),
                                          I(3) => undef,
                                          z => H(15)
                                        );

end Behavioral;
