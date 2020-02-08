----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 08.02.2020 17:42:50
-- Design Name:
-- Module Name: multiplexer8_16bit_tb - Behavioral
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

entity multiplexer8_16bit_tb is
end multiplexer8_16bit_tb;

architecture bench of multiplexer8_16bit_tb is

  component multiplexer8_16bit
     port(s : in std_logic_vector(2 downto 0);
          in1 : in std_logic_vector(15 downto 0);
          in2 : in std_logic_vector(15 downto 0);
          in3 : in std_logic_vector(15 downto 0);
          in4 : in std_logic_vector(15 downto 0);
          in5 : in std_logic_vector(15 downto 0);
          in6 : in std_logic_vector(15 downto 0);
          in7 : in std_logic_vector(15 downto 0);
          in8 : in std_logic_vector(15 downto 0);
          z : out std_logic_vector(15 downto 0));
  end component;

  signal s: std_logic_vector(2 downto 0);
  signal in1: std_logic_vector(15 downto 0);
  signal in2: std_logic_vector(15 downto 0);
  signal in3: std_logic_vector(15 downto 0);
  signal in4: std_logic_vector(15 downto 0);
  signal in5: std_logic_vector(15 downto 0);
  signal in6: std_logic_vector(15 downto 0);
  signal in7: std_logic_vector(15 downto 0);
  signal in8: std_logic_vector(15 downto 0);
  signal z: std_logic_vector(15 downto 0);

begin

  uut: multiplexer8_16bit port map ( s   => s,
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

    in1 <= "0000000000000001";
    in2 <= "0000000000000010";
    in3 <= "0000000000000011";
    in4 <= "0000000000000100";
    in5 <= "0000000000000101";
    in6 <= "0000000000000110";
    in7 <= "0000000000000111";
    in8 <= "0000000000001000";
    s <= "000";

    -- test bench stimulus code

    s <= "000";

    wait for 10 ns;

    s <= "001";

    wait for 10 ns;

    s <= "010";

    wait for 10 ns;

    s <= "011";

    wait for 10 ns;

    s <= "100";

    wait for 10 ns;

    s <= "101";

    wait for 10 ns;

    s <= "110";

    wait for 10 ns;

    s <= "111";

  end process;


end;
