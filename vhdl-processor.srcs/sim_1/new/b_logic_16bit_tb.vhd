----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 00:37:10
-- Design Name:
-- Module Name: b_logic_16bit_tb - Behavioral
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

entity b_logic_16bit_tb is
  end b_logic_16bit_tb;

architecture bench of b_logic_16bit_tb is

  component b_logic_16bit
    port (B : in std_logic_vector (15 downto 0);
          S : in std_logic_vector (1 downto 0);
          output : out std_logic_vector (15 downto 0));
  end component;

  signal B: std_logic_vector (15 downto 0);
  signal S: std_logic_vector (1 downto 0);
  signal output: std_logic_vector (15 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: b_logic_16bit port map ( B      => B,
                                S      => S,
                                output => output );

  stimulus: process
  begin

    -- initialisation code

    B <= x"aaaa";
    S <= "00";

    -- test bench stimulus code

    S <= "00";
    wait for wait_delay;
    S <= "01";
    wait for wait_delay;
    S <= "10";
    wait for wait_delay;
    S <= "11";
    wait for wait_delay;

    wait;
  end process;


end;
