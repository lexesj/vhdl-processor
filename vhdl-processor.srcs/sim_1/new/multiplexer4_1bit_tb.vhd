----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 01:51:17
-- Design Name:
-- Module Name: multiplexer4_1bit_tb - Behavioral
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

entity multiplexer4_1bit_tb is
end multiplexer4_1bit_tb;

architecture bench of multiplexer4_1bit_tb is

  component multiplexer4_1bit
     port (S : in std_logic_vector (1 downto 0);
           I : in std_logic_vector (3 downto 0);
           z : out std_logic);
  end component;

  signal S: std_logic_vector (1 downto 0);
  signal I: std_logic_vector (3 downto 0);
  signal z: std_logic;

  constant gate_delay: time := 10 ns;
begin

  uut: multiplexer4_1bit port map ( S => S,
                                    I => I,
                                    z => z );

  stimulus: process
  begin

    -- initialisation code

    S <= "00";
    I <= x"a";

    -- test bench stimulus code

    S <= "00";
    wait for gate_delay;
    S <= "01";
    wait for gate_delay;
    S <= "10";
    wait for gate_delay;
    S <= "11";
    wait for gate_delay;

    wait;
  end process;


end;
