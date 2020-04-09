----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 09.04.2020 16:04:29
-- Design Name:
-- Module Name: multiplexer8_8bit_tb - Behavioral
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

entity multiplexer8_8bit_tb is
end multiplexer8_8bit_tb;

architecture bench of multiplexer8_8bit_tb is

  component multiplexer8_8bit
    port(s : in std_logic_vector(2 downto 0);
         in1 : in std_logic_vector(7 downto 0);
         in2 : in std_logic_vector(7 downto 0);
         in3 : in std_logic_vector(7 downto 0);
         in4 : in std_logic_vector(7 downto 0);
         in5 : in std_logic_vector(7 downto 0);
         in6 : in std_logic_vector(7 downto 0);
         in7 : in std_logic_vector(7 downto 0);
         in8 : in std_logic_vector(7 downto 0);
         z : out std_logic_vector(7 downto 0));
  end component;

  signal s: std_logic_vector(2 downto 0);
  signal in1: std_logic_vector(7 downto 0);
  signal in2: std_logic_vector(7 downto 0);
  signal in3: std_logic_vector(7 downto 0);
  signal in4: std_logic_vector(7 downto 0);
  signal in5: std_logic_vector(7 downto 0);
  signal in6: std_logic_vector(7 downto 0);
  signal in7: std_logic_vector(7 downto 0);
  signal in8: std_logic_vector(7 downto 0);
  signal z: std_logic_vector(7 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: multiplexer8_8bit port map ( s   => s,
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

    in1 <= x"01";
    in2 <= x"02";
    in3 <= x"03";
    in4 <= x"04";
    in5 <= x"05";
    in6 <= x"06";
    in7 <= x"07";
    in8 <= x"08";
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
