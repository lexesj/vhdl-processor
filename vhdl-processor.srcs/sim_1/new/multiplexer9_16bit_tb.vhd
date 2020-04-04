----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 04.04.2020 14:23:41
-- Design Name:
-- Module Name: multiplexer9_16bit_tb - Behavioral
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

entity multiplexer9_16bit_tb is
--  Port ( );
end multiplexer9_16bit_tb;

architecture bench of multiplexer9_16bit_tb is

  component multiplexer9_16bit
     port(s : in std_logic_vector(3 downto 0);
          in1 : in std_logic_vector(15 downto 0);
          in2 : in std_logic_vector(15 downto 0);
          in3 : in std_logic_vector(15 downto 0);
          in4 : in std_logic_vector(15 downto 0);
          in5 : in std_logic_vector(15 downto 0);
          in6 : in std_logic_vector(15 downto 0);
          in7 : in std_logic_vector(15 downto 0);
          in8 : in std_logic_vector(15 downto 0);
          in9 : in std_logic_vector(15 downto 0);
          z : out std_logic_vector(15 downto 0));
  end component;

  signal s: std_logic_vector(3 downto 0);
  signal in1: std_logic_vector(15 downto 0);
  signal in2: std_logic_vector(15 downto 0);
  signal in3: std_logic_vector(15 downto 0);
  signal in4: std_logic_vector(15 downto 0);
  signal in5: std_logic_vector(15 downto 0);
  signal in6: std_logic_vector(15 downto 0);
  signal in7: std_logic_vector(15 downto 0);
  signal in8: std_logic_vector(15 downto 0);
  signal in9: std_logic_vector(15 downto 0);
  signal z: std_logic_vector(15 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: multiplexer9_16bit port map ( s   => s,
                                     in1 => in1,
                                     in2 => in2,
                                     in3 => in3,
                                     in4 => in4,
                                     in5 => in5,
                                     in6 => in6,
                                     in7 => in7,
                                     in8 => in8,
                                     in9 => in9,
                                     z   => z );

  stimulus: process
  begin

    -- initialisation code

    in1 <= x"0001";
    in2 <= x"0002";
    in3 <= x"0003";
    in4 <= x"0004";
    in5 <= x"0005";
    in6 <= x"0006";
    in7 <= x"0007";
    in8 <= x"0008";
    in9 <= x"0009";
    s <= x"0";

    -- test bench stimulus code
    s <= x"0";
    wait for wait_delay;
    s <= x"1";
    wait for wait_delay;
    s <= x"2";
    wait for wait_delay;
    s <= x"3";
    wait for wait_delay;
    s <= x"4";
    wait for wait_delay;
    s <= x"5";
    wait for wait_delay;
    s <= x"6";
    wait for wait_delay;
    s <= x"7";
    wait for wait_delay;
    s <= x"8";
    wait for wait_delay;

    wait;
  end process;

end;
