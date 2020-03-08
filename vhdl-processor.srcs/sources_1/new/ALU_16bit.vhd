----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 02:34:49
-- Design Name:
-- Module Name: ALU_16bit - Behavioral
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

entity ALU_16bit is
   port (A : in std_logic_vector (15 downto 0);
         B : in std_logic_vector (15 downto 0);
         c_in : in std_logic;
         S : in std_logic_vector (2 downto 0);
         G : out std_logic_vector (15 downto 0);
         c_out : out std_logic);
end ALU_16bit;

architecture Behavioral of ALU_16bit is

   component arithmetic_circuit_16bit is
      port (c_in : in std_logic;
            c_out : out std_logic;
            A : in std_logic_vector (15 downto 0);
            B : in std_logic_vector (15 downto 0);
            S : in std_logic_vector (1 downto 0);
            G : out std_logic_vector (15 downto 0));
   end component;

   component logic_circuit_16bit is
      port (A : in std_logic_vector (15 downto 0);
            B : in std_logic_vector (15 downto 0);
            S : in std_logic_vector (1 downto 0);
            G : out std_logic_vector (15 downto 0));
   end component;

   component multiplexer2_16bit is
      port(s : in std_logic;
           in1 : in std_logic_vector(15 downto 0);
           in2 : in std_logic_vector(15 downto 0);
           z : out std_logic_vector(15 downto 0));
   end component;

   signal ac_q, lc_q: std_logic_vector(15 downto 0);
begin
   ac : arithmetic_circuit_16bit port map (
                                             c_in => c_in,
                                             c_out => c_out,
                                             A => A,
                                             B => B,
                                             S(0) => S(0),
                                             S(1) => S(1),
                                             G => ac_q
                                          );

   lc : logic_circuit_16bit port map (
                                       A => A,
                                       B => B,
                                       S(0) => S(0),
                                       S(1) => S(1),
                                       G => lc_q
                                     );

   mux : multiplexer2_16bit port map (
                                       s => S(2),
                                       in1 => ac_q,
                                       in2 => lc_q,
                                       z => G
                                     );

end Behavioral;
