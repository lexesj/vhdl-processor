----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 22:20:06
-- Design Name: 
-- Module Name: memory_512x16bits_tb - Behavioral
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

entity memory_512x16bits_tb is
end memory_512x16bits_tb;

architecture bench of memory_512x16bits_tb is

  component memory_512x16bits
    port (address : in std_logic_vector(15 downto 0);
          write_data : in std_logic_vector(15 downto 0);
          mem_write : in std_logic;
          clock : in std_logic;
          read_data : out std_logic_vector(15 downto 0));
  end component;

  signal address: std_logic_vector(15 downto 0);
  signal write_data: std_logic_vector(15 downto 0);
  signal mem_write: std_logic;
  signal clock: std_logic;
  signal read_data: std_logic_vector(15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: memory_512x16bits port map ( address    => address,
                                    write_data => write_data,
                                    mem_write  => mem_write,
                                    clock      => clock,
                                    read_data  => read_data );

  stimulus: process
  begin
  
    -- initialisation code
    address <= x"0000";
    write_data <= x"0000";
    mem_write <= '0';

    -- test bench stimulus code
    address <= x"0000";
    wait for clock_period;
    address <= x"0001";
    wait for clock_period;
    address <= x"0002";
    wait for clock_period;
    address <= x"0003";
    wait for clock_period;
    address <= x"0000";
    write_data <= x"0000";
    mem_write <= '1';
    wait for clock_period;
    address <= x"0001";
    write_data <= x"0001";
    wait for clock_period;
    address <= x"0002";
    write_data <= x"0002";
    wait for clock_period;
    address <= x"0003";
    write_data <= x"0003";
    wait for clock_period;
    address <= x"0000";
    mem_write <= '0';
    wait for clock_period;
    address <= x"0001";
    wait for clock_period;
    address <= x"0002";
    wait for clock_period;
    address <= x"0003";
    wait for clock_period;
    stop_the_clock <= true;

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
