----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10.04.2020 00:24:03
-- Design Name:
-- Module Name: multiplexer8_1bit_tb - Behavioral
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

entity multiplexer8_1bit_tb is
end multiplexer8_1bit_tb;

architecture bench of multiplexer8_1bit_tb is

  component multiplexer8_1bit
    port(s : in std_logic_vector(2 downto 0);
         in1 : in std_logic;
         in2 : in std_logic;
         in3 : in std_logic;
         in4 : in std_logic;
         in5 : in std_logic;
         in6 : in std_logic;
         in7 : in std_logic;
         in8 : in std_logic;
         z : out std_logic);
  end component;

  signal s: std_logic_vector(2 downto 0);
  signal in1: std_logic;
  signal in2: std_logic;
  signal in3: std_logic;
  signal in4: std_logic;
  signal in5: std_logic;
  signal in6: std_logic;
  signal in7: std_logic;
  signal in8: std_logic;
  signal z: std_logic;

  constant wait_delay: time := 10 ns;
begin

  uut: multiplexer8_1bit port map ( s   => s,
                                    in1 => in1,
                                    in2 => in2,
                                    in3 => in3,
                                    in4 => in4,
                                    in5 => in5,
                                    in6 => in6,
                                    in7 => in7,
                                    in8 => in8,
                                    z   => z );

  stimulus: process
  begin

    -- initialisation code

    in1 <= '0';
    in2 <= '1';
    in3 <= '0';
    in4 <= '1';
    in5 <= '0';
    in6 <= '1';
    in7 <= '0';
    in8 <= '1';
    s <= "000";

    -- test bench stimulus code
    s <= "000";
    wait for wait_delay;
    s <= "001";
    wait for wait_delay;
    s <= "010";
    wait for wait_delay;
    s <= "011";
    wait for wait_delay;
    s <= "100";
    wait for wait_delay;
    s <= "101";
    wait for wait_delay;
    s <= "110";
    wait for wait_delay;
    s <= "111";
    wait for wait_delay;

    wait;
  end process;


end;
