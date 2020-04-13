----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 08.02.2020 17:53:34
-- Design Name:
-- Module Name: reg16_tb - Behavioral
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

entity reg16_tb is
end reg16_tb;

architecture bench of reg16_tb is

  component reg16
     port(D : in std_logic_vector(15 downto 0);
     reset, load, Clk : in std_logic;
     Q : out std_logic_vector(15 downto 0));
  end component;

  signal D: std_logic_vector(15 downto 0);
  signal reset, load, Clk: std_logic;
  signal Q: std_logic_vector(15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: reg16 port map ( D    => D,
                        reset => reset,
                        load => load,
                        Clk  => Clk,
                        Q    => Q );

  stimulus: process
  begin

    -- initialisation code

    D <= "0000000000000000";
    load <= '0';
    reset <= '0';

    -- test bench stimulus code
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    D <= "0101010101010101";
    load <= '1';
    wait for 10 ns;
    load <= '0';
    wait for 10 ns;
    load <= '1';
    D <= "1010101010101010";
    wait for 10 ns;
    load <= '0';
    wait for 10 ns;
    load <= '1';
    D <= "0000000011111111";
    wait for 10 ns;
    load <= '0';
    wait for 10 ns;
    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      Clk <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;
