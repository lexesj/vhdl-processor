----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 02:00:57
-- Design Name:
-- Module Name: logic_circuit_16bit - Behavioral
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

entity logic_circuit_16bit is
   port (A : in std_logic_vector (15 downto 0);
         B : in std_logic_vector (15 downto 0);
         S : in std_logic_vector (1 downto 0);
         G : out std_logic_vector (15 downto 0));
end logic_circuit_16bit;

architecture Behavioral of logic_circuit_16bit is
   component multiplexer4_1bit is
      port (S : in std_logic_vector (1 downto 0);
            I : in std_logic_vector (3 downto 0);
            z : out std_logic);
   end component;

   signal and_q,or_q,xor_q,not_q : std_logic_vector (15 downto 0);
begin

   and_q <= A and B;
   or_q <= A or B;
   xor_q <= A xor B;
   not_q <= not A;

   mux0000 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(0),
                                          I(1) => or_q(0),
                                          I(2) => xor_q(0),
                                          I(3) => not_q(0),
                                          z => G(0)
                                        );
   mux0001 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(1),
                                          I(1) => or_q(1),
                                          I(2) => xor_q(1),
                                          I(3) => not_q(1),
                                          z => G(1)
                                        );
   mux0010 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(2),
                                          I(1) => or_q(2),
                                          I(2) => xor_q(2),
                                          I(3) => not_q(2),
                                          z => G(2)
                                        );
   mux0011 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(3),
                                          I(1) => or_q(3),
                                          I(2) => xor_q(3),
                                          I(3) => not_q(3),
                                          z => G(3)
                                        );
   mux0100 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(4),
                                          I(1) => or_q(4),
                                          I(2) => xor_q(4),
                                          I(3) => not_q(4),
                                          z => G(4)
                                        );
   mux0101 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(5),
                                          I(1) => or_q(5),
                                          I(2) => xor_q(5),
                                          I(3) => not_q(5),
                                          z => G(5)
                                        );
   mux0110 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(6),
                                          I(1) => or_q(6),
                                          I(2) => xor_q(6),
                                          I(3) => not_q(6),
                                          z => G(6)
                                        );
   mux0111 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(7),
                                          I(1) => or_q(7),
                                          I(2) => xor_q(7),
                                          I(3) => not_q(7),
                                          z => G(7)
                                        );
   mux1000 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(8),
                                          I(1) => or_q(8),
                                          I(2) => xor_q(8),
                                          I(3) => not_q(8),
                                          z => G(8)
                                        );
   mux1001 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(9),
                                          I(1) => or_q(9),
                                          I(2) => xor_q(9),
                                          I(3) => not_q(9),
                                          z => G(9)
                                        );
   mux1010 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(10),
                                          I(1) => or_q(10),
                                          I(2) => xor_q(10),
                                          I(3) => not_q(10),
                                          z => G(10)
                                        );
   mux1011 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(11),
                                          I(1) => or_q(11),
                                          I(2) => xor_q(11),
                                          I(3) => not_q(11),
                                          z => G(11)
                                        );
   mux1100 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(12),
                                          I(1) => or_q(12),
                                          I(2) => xor_q(12),
                                          I(3) => not_q(12),
                                          z => G(12)
                                        );
   mux1101 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(13),
                                          I(1) => or_q(13),
                                          I(2) => xor_q(13),
                                          I(3) => not_q(13),
                                          z => G(13)
                                        );
   mux1110 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(14),
                                          I(1) => or_q(14),
                                          I(2) => xor_q(14),
                                          I(3) => not_q(14),
                                          z => G(14)
                                        );
   mux1111 : multiplexer4_1bit port map (
                                          S => S,
                                          I(0) => and_q(15),
                                          I(1) => or_q(15),
                                          I(2) => xor_q(15),
                                          I(3) => not_q(15),
                                          z => G(15)
                                        );

end Behavioral;
