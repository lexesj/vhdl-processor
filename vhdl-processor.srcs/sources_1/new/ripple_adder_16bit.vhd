----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07.03.2020 22:31:54
-- Design Name:
-- Module Name: ripple_adder_16bit - Behavioral
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

entity ripple_adder_16bit is
   port (c_in : in std_logic;
         c_out : out std_logic;
         X : in std_logic_vector (15 downto 0);
         Y : in std_logic_vector (15 downto 0);
         G : out std_logic_vector (15 downto 0));
end ripple_adder_16bit;

architecture Behavioral of ripple_adder_16bit is
   component full_adder is
      port(in1 : in std_logic;
           in2 : in std_logic;
           c_in : in std_logic;
           c_out : out std_logic;
           sum : out std_logic);
   end component;

   signal C : std_logic_vector (15 downto 0);
begin
   full_adder0000 : full_adder port map (
                                           c_in => c_in,
                                           in1 => X(0),
                                           in2 => Y(0),
                                           c_out => C(0),
                                           sum => G(0)
                                        );

   full_adder0001 : full_adder port map (
                                           c_in => C(0),
                                           in1 => X(1),
                                           in2 => Y(1),
                                           c_out => C(1),
                                           sum => G(1)
                                        );

   full_adder0010 : full_adder port map (
                                           c_in => C(1),
                                           in1 => X(2),
                                           in2 => Y(2),
                                           c_out => C(2),
                                           sum => G(2)
                                        );

   full_adder0011 : full_adder port map (
                                           c_in => C(2),
                                           in1 => X(3),
                                           in2 => Y(3),
                                           c_out => C(3),
                                           sum => G(3)
                                        );

   full_adder0100 : full_adder port map (
                                           c_in => C(3),
                                           in1 => X(4),
                                           in2 => Y(4),
                                           c_out => C(4),
                                           sum => G(4)
                                        );

   full_adder0101 : full_adder port map (
                                           c_in => C(4),
                                           in1 => X(5),
                                           in2 => Y(5),
                                           c_out => C(5),
                                           sum => G(5)
                                        );

   full_adder0110 : full_adder port map (
                                           c_in => C(5),
                                           in1 => X(6),
                                           in2 => Y(6),
                                           c_out => C(6),
                                           sum => G(6)
                                        );

   full_adder0111 : full_adder port map (
                                           c_in => C(6),
                                           in1 => X(7),
                                           in2 => Y(7),
                                           c_out => C(7),
                                           sum => G(7)
                                        );

   full_adder1000 : full_adder port map (
                                           c_in => C(7),
                                           in1 => X(8),
                                           in2 => Y(8),
                                           c_out => C(8),
                                           sum => G(8)
                                        );

   full_adder1001 : full_adder port map (
                                           c_in => C(8),
                                           in1 => X(9),
                                           in2 => Y(9),
                                           c_out => C(9),
                                           sum => G(9)
                                        );

   full_adder1010 : full_adder port map (
                                           c_in => C(9),
                                           in1 => X(10),
                                           in2 => Y(10),
                                           c_out => C(10),
                                           sum => G(10)
                                        );

   full_adder1011 : full_adder port map (
                                           c_in => C(10),
                                           in1 => X(11),
                                           in2 => Y(11),
                                           c_out => C(11),
                                           sum => G(11)
                                        );

   full_adder1100 : full_adder port map (
                                           c_in => C(11),
                                           in1 => X(12),
                                           in2 => Y(12),
                                           c_out => C(12),
                                           sum => G(12)
                                        );

   full_adder1101 : full_adder port map (
                                           c_in => C(12),
                                           in1 => X(13),
                                           in2 => Y(13),
                                           c_out => C(13),
                                           sum => G(13)
                                        );

   full_adder1110 : full_adder port map (
                                           c_in => C(13),
                                           in1 => X(14),
                                           in2 => Y(14),
                                           c_out => C(14),
                                           sum => G(14)
                                        );

   full_adder1111 : full_adder port map (
                                           c_in => C(14),
                                           in1 => X(15),
                                           in2 => Y(15),
                                           c_out => C(15),
                                           sum => G(15)
                                        );

   c_out <= C(15);
end Behavioral;
