----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 17:18:43
-- Design Name: 
-- Module Name: instruction_register_tb - Behavioral
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

entity instruction_register_tb is
end instruction_register_tb;

architecture bench of instruction_register_tb is

  component instruction_register
    port (clock : in std_logic;
          instruction_load : in std_logic;
          input : in std_logic_vector (15 downto 0);
          opcode : out std_logic_vector (7 downto 0);
          dest_reg : out std_logic_vector (2 downto 0);
          sel_a : out std_logic_vector (2 downto 0);
          sel_b : out std_logic_vector (2 downto 0));
  end component;

  signal clock: std_logic;
  signal instruction_load: std_logic;
  signal input: std_logic_vector (15 downto 0);
  signal opcode: std_logic_vector (7 downto 0);
  signal dest_reg: std_logic_vector (2 downto 0);
  signal sel_a: std_logic_vector (2 downto 0);
  signal sel_b: std_logic_vector (2 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: instruction_register port map ( clock            => clock,
                                       instruction_load => instruction_load,
                                       input            => input,
                                       opcode           => opcode,
                                       dest_reg         => dest_reg,
                                       sel_a            => sel_a,
                                       sel_b            => sel_b );

  stimulus: process
  begin
  
    -- initialisation code

    input <= b"0000000_000_000_000";
    instruction_load <= '0';

    -- test bench stimulus code

    input <= b"0101010_100_010_001";
    instruction_load <= '1';
    wait for clock_period;
    input <= b"1010101_001_010_100";
    instruction_load <= '0';
    wait for clock_period;
    input <= b"1010101_001_010_100";
    instruction_load <= '1';
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
