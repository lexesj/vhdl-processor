----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 00:48:25
-- Design Name:
-- Module Name: arithmetic_circuit_16bit - Behavioral
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

entity arithmetic_circuit_16bit is
   port (c_in : in std_logic;
         c_out : out std_logic;
         A : in std_logic_vector (15 downto 0);
         B : in std_logic_vector (15 downto 0);
         S : in std_logic_vector (1 downto 0);
         G : out std_logic_vector (15 downto 0));
end arithmetic_circuit_16bit;

architecture Behavioral of arithmetic_circuit_16bit is
   component ripple_adder_16bit is
      port (c_in : in std_logic;
            c_out : out std_logic;
            X : in std_logic_vector (15 downto 0);
            Y : in std_logic_vector (15 downto 0);
            G : out std_logic_vector (15 downto 0));
   end component;

   component b_logic_16bit is
      port (B : in std_logic_vector (15 downto 0);
            S : in std_logic_vector (1 downto 0);
            output : out std_logic_vector (15 downto 0));
   end component;

   signal logic_out : std_logic_vector (15 downto 0);
begin
   b_logic : b_logic_16bit port map (
                                       B => B,
                                       S => S,
                                       output => logic_out
                                    );

   ra : ripple_adder_16bit port map (
                                       c_in => c_in,
                                       c_out => c_out,
                                       X => A,
                                       Y => logic_out,
                                       G => G
                                    );

end Behavioral;
