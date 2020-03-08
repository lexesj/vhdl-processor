----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 00:10:08
-- Design Name:
-- Module Name: multiplexer2_1bit_tb - Behavioral
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

entity multiplexer2_1bit_tb is
end multiplexer2_1bit_tb;

architecture bench of multiplexer2_1bit_tb is

  component multiplexer2_1bit
    port(s : in std_logic;
         in1 : in std_logic;
         in2 : in std_logic;
         z : out std_logic);
  end component;

  signal s: std_logic;
  signal in1: std_logic;
  signal in2: std_logic;
  signal z: std_logic;

  constant wait_delay: time := 10 ns;
begin

  uut: multiplexer2_1bit port map ( s   => s,
                                    in1 => in1,
                                    in2 => in2,
                                    z   => z );

  stimulus: process
  begin

    -- initialisation code

    s <= '0';
    in1 <= '0';
    in2 <= '0';

    -- test bench stimulus code

    s <= '0';
    in1 <= '0';
    in2 <= '0';
    wait for wait_delay;
    s <= '0';
    in1 <= '0';
    in2 <= '1';
    wait for wait_delay;
    s <= '0';
    in1 <= '1';
    in2 <= '0';
    wait for wait_delay;
    s <= '0';
    in1 <= '1';
    in2 <= '1';
    wait for wait_delay;
    s <= '1';
    in1 <= '0';
    in2 <= '0';
    wait for wait_delay;
    s <= '1';
    in1 <= '0';
    in2 <= '1';
    wait for wait_delay;
    s <= '1';
    in1 <= '1';
    in2 <= '0';
    wait for wait_delay;
    s <= '1';
    in1 <= '1';
    in2 <= '1';
    wait for wait_delay;

    wait;
  end process;


end;
