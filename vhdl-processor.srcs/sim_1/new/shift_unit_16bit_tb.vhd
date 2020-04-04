----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 04:06:28
-- Design Name:
-- Module Name: shift_unit_16bit_tb - Behavioral
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

entity shift_unit_16bit_tb is
end shift_unit_16bit_tb;

architecture bench of shift_unit_16bit_tb is

  component shift_unit_16bit
     port (B : in std_logic_vector (15 downto 0);
           I : in std_logic_vector (1 downto 0);
           S : in std_logic_vector (1 downto 0);
           H : out std_logic_vector (15 downto 0));
  end component;

  signal B: std_logic_vector (15 downto 0);
  signal I: std_logic_vector (1 downto 0);
  signal S: std_logic_vector (1 downto 0);
  signal H: std_logic_vector (15 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: shift_unit_16bit port map ( B => B,
                                   I => I,
                                   S => S,
                                   H => H );

  stimulus: process
  begin

    -- initialisation code

    B <= x"afaf";
    I <= "00";
    S <= "00";

    -- test bench stimulus code

    -- don't shift
    S <= "00";
    wait for wait_delay;
    -- shift left
    S <= "10";
    wait for wait_delay;
    -- shift right
    S <= "01";
    wait for wait_delay;
    -- undefined
    S <= "11";
    wait for wait_delay;

    wait;
  end process;


end;