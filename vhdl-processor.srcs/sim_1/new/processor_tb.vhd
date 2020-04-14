----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2020 22:01:28
-- Design Name: 
-- Module Name: processor_tb - Behavioral
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

entity processor_tb is
end processor_tb;

architecture bench of processor_tb is

  component processor
    port (clock : in std_logic;
          reset : in std_logic);
  end component;

  signal clock: std_logic;
  signal reset: std_logic;

  constant clock_period: time := 100 ns;
  signal stop_the_clock: boolean;
begin

  uut: processor port map ( clock => clock,
                            reset => reset );

  stimulus: process
  begin
  
    -- initialisation code
    reset <= '1';
    wait for clock_period;

    -- test bench stimulus code
    reset <= '0';

    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clock <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
