----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 23:29:01
-- Design Name: 
-- Module Name: program_counter16bit_tb - Behavioral
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

entity program_counter16bit_tb is
end program_counter16bit_tb;

architecture bench of program_counter16bit_tb is

  component program_counter16bit
    port (displacement : in std_logic_vector (15 downto 0);
          pc_load : in std_logic;
          pc_increment : in std_logic;
          clock : in std_logic;
          reset : in std_logic;
          addr_out : out std_logic_vector (15 downto 0));
  end component;

  signal displacement: std_logic_vector (15 downto 0);
  signal pc_load: std_logic;
  signal pc_increment: std_logic;
  signal clock: std_logic;
  signal reset: std_logic;
  signal addr_out: std_logic_vector (15 downto 0);

  constant clock_period: time := 50 ns;
  signal stop_the_clock: boolean;

begin

  uut: program_counter16bit port map ( displacement => displacement,
                                       pc_load      => pc_load,
                                       pc_increment => pc_increment,
                                       clock        => clock,
                                       reset        => reset,
                                       addr_out     => addr_out );

  stimulus: process
  begin
  
    -- initialisation code
    displacement <= x"0000";
    pc_load <= '0';
    pc_increment <= '0';
    reset <= '0';

    -- test bench stimulus code
    reset <= '1';
    wait for clock_period;
    reset <= '0';
    pc_load <= '0';
    pc_increment <= '1';
    wait for clock_period;
    displacement <= x"00ff";
    pc_load <= '1';
    pc_increment <= '0';
    wait for clock_period;
    displacement <= x"ffff";
    pc_load <= '1';
    pc_increment <= '0';
    wait for clock_period;
    pc_load <= '0';
    pc_increment <= '1';
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
