----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 07.03.2020 22:11:20
-- Design Name:
-- Module Name: full_adder_tb - Behavioral
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

entity full_adder_tb is
end full_adder_tb;

architecture bench of full_adder_tb is

  component full_adder
     port(in1 : in std_logic;
  	in2 : in std_logic;
  	c_in : in std_logic;
  	c_out : out std_logic;
  	sum : out std_logic);
  end component;

  signal in1: std_logic;
  signal in2: std_logic;
  signal c_in: std_logic;
  signal c_out: std_logic;
  signal sum: std_logic;

begin

  uut: full_adder port map ( in1   => in1,
                             in2   => in2,
                             c_in  => c_in,
                             c_out => c_out,
                             sum   => sum );

  stimulus: process
  begin

    -- initialisation code

    in1 <= '0';
    in2 <= '0';
    c_in <= '0';

    -- test bench stimulus code

    in1 <= '0';
    in2 <= '0';
    c_in <= '0';
    wait for 10 ns;
    in1 <= '0';
    in2 <= '0';
    c_in <= '1';
    wait for 10 ns;
    in1 <= '0';
    in2 <= '1';
    c_in <= '0';
    wait for 10 ns;
    in1 <= '0';
    in2 <= '1';
    c_in <= '1';
    wait for 10 ns;
    in1 <= '1';
    in2 <= '0';
    c_in <= '0';
    wait for 10 ns;
    in1 <= '1';
    in2 <= '0';
    c_in <= '1';
    wait for 10 ns;
    in1 <= '1';
    in2 <= '1';
    c_in <= '0';
    wait for 10 ns;
    in1 <= '1';
    in2 <= '1';
    c_in <= '1';
    wait for 10 ns;

    wait;
  end process;


end;
