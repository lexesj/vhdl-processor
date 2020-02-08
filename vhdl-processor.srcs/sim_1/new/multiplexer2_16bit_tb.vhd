----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 07.02.2020 16:55:38
-- Design Name:
-- Module Name: multiplexer2_16bit_tb - Behavioral
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

entity multiplexer2_16bit_tb is
end multiplexer2_16bit_tb;

architecture bench of multiplexer2_16bit_tb is

  component multiplexer2_16bit
    port(s : in std_logic;
         in1 : in std_logic_vector(15 downto 0);
         in2 : in std_logic_vector(15 downto 0);
         z : out std_logic_vector(15 downto 0));
  end component;

  signal s: std_logic;
  signal in1: std_logic_vector(15 downto 0);
  signal in2: std_logic_vector(15 downto 0);
  signal z: std_logic_vector(15 downto 0);

begin

  uut: multiplexer2_16bit port map ( s   => s,
                                     in1 => in1,
                                     in2 => in2,
                                     z   => z );

  stimulus: process
  begin

    -- initialisation code

    in1 <= "0000000011111111";
    in2 <= "1111111100000000";
    s <= '0';

    -- test bench stimulus code

    s <= '0';
    wait for 5 ns;
    s <= '1';

  end process;


end;
