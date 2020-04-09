----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2020 00:02:23
-- Design Name: 
-- Module Name: CAR8bit_tb - Behavioral
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

entity CAR8bit_tb is
end CAR8bit_tb;

architecture bench of CAR8bit_tb is

  component CAR8bit
    port (clock : in std_logic;
          load : in std_logic;
          reset : in std_logic;
          input : in std_logic_vector (7 downto 0);
          addr_out : out std_logic_vector (7 downto 0));
  end component;

  signal clock: std_logic;
  signal load: std_logic;
  signal reset: std_logic;
  signal input: std_logic_vector (7 downto 0);
  signal addr_out: std_logic_vector (7 downto 0);

  constant clock_period: time := 50 ns;
  signal stop_the_clock: boolean;

begin

  uut: CAR8bit port map ( clock    => clock,
                          load     => load,
                          reset    => reset,
                          input    => input,
                          addr_out => addr_out );

  stimulus: process
  begin
  
    -- initialisation code

    load <= '0';
    reset <= '0';
    input <= x"00";

    -- test bench stimulus code
    reset <= '1';
    wait for clock_period;
    reset <= '0';
    wait for clock_period;
    wait for clock_period;
    load <= '1';
    reset <= '0';
    input <= x"0f";
    wait for clock_period;
    load <= '0';
    input <= x"00";
    stop_the_clock <= true;
    wait for clock_period;

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
