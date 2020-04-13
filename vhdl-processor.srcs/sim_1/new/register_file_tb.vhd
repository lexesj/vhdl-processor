----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
--
-- Create Date: 07.02.2020 00:42:41
-- Design Name:
-- Module Name: register_file_tb - Behavioral
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_file_tb is
end register_file_tb;

architecture bench of register_file_tb is

  component register_file
     port(
          Clk : in std_logic;
          load_enable: in std_logic;
          reset: in std_logic;
          A_sel : in std_logic_vector (3 downto 0);
          B_sel : in std_logic_vector (3 downto 0);
          des_sel : in std_logic_vector (3 downto 0);
          D_data : in std_logic_vector (15 downto 0);
          A_data : out std_logic_vector (15 downto 0);
          B_data : out std_logic_vector (15 downto 0));
  end component;

  signal Clk: std_logic;
  signal load_enable: std_logic;
  signal reset: std_logic;
  signal A_sel: std_logic_vector (3 downto 0);
  signal B_sel: std_logic_vector (3 downto 0);
  signal des_sel: std_logic_vector (3 downto 0);
  signal D_data: std_logic_vector (15 downto 0);
  signal A_data: std_logic_vector (15 downto 0);
  signal B_data: std_logic_vector (15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: register_file port map ( Clk         => Clk,
                                load_enable => load_enable,
                                reset       => reset,
                                A_sel       => A_sel,
                                B_sel       => B_sel,
                                des_sel     => des_sel,
                                D_data      => D_data,
                                A_data      => A_data,
                                B_data      => B_data );

  stimulus: process
  begin

    -- initialisation code

    reset <= '0';
    D_data <= x"0000";
    A_sel <= "0000";
    B_sel <= "0000";

    -- test bench stimulus code

    reset <= '1';
    wait for clock_period;
    reset <= '0';

    -- load enabled ---------------------------------------------------------

    load_enable <= '1';

    -- load nums 0-8 into each register
    des_sel <= "0000";
    D_data <= x"0000";
    wait for 10 ns;
    des_sel <= "0001";
    D_data <= x"0001";
    wait for 10 ns;
    des_sel <= "0010";
    D_data <= x"0002";
    wait for 10 ns;
    des_sel <= "0011";
    D_data <= x"0003";
    wait for 10 ns;
    des_sel <= "0100";
    D_data <= x"0004";
    wait for 10 ns;
    des_sel <= "0101";
    D_data <= x"0005";
    wait for 10 ns;
    des_sel <= "0110";
    D_data <= x"0006";
    wait for 10 ns;
    des_sel <= "0111";
    D_data <= x"0007";
    wait for 10 ns;
    des_sel <= "1000";
    D_data <= x"0008";
    wait for 10 ns;

    -- change A select
    A_sel <= "0000";
    wait for 10 ns;
    A_sel <= "0001";
    wait for 10 ns;
    A_sel <= "0010";
    wait for 10 ns;
    A_sel <= "0011";
    wait for 10 ns;
    A_sel <= "0100";
    wait for 10 ns;
    A_sel <= "0101";
    wait for 10 ns;
    A_sel <= "0110";
    wait for 10 ns;
    A_sel <= "0111";
    wait for 10 ns;
    A_sel <= "1000";
    wait for 10 ns;

    -- change B select
    B_sel <= "0000";
    wait for 10 ns;
    B_sel <= "0001";
    wait for 10 ns;
    B_sel <= "0010";
    wait for 10 ns;
    B_sel <= "0011";
    wait for 10 ns;
    B_sel <= "0100";
    wait for 10 ns;
    B_sel <= "0101";
    wait for 10 ns;
    B_sel <= "0110";
    wait for 10 ns;
    B_sel <= "0111";
    wait for 10 ns;
    B_sel <= "1000";
    wait for 10 ns;

    -- load disabled ---------------------------------------------------------

    load_enable <= '0';

    -- load nums 9-17 into each register
    des_sel <= "0000";
    D_data <= x"0009";
    wait for 10 ns;
    des_sel <= "0001";
    D_data <= x"000a";
    wait for 10 ns;
    des_sel <= "0010";
    D_data <= x"000b";
    wait for 10 ns;
    des_sel <= "0011";
    D_data <= x"000c";
    wait for 10 ns;
    des_sel <= "0100";
    D_data <= x"000d";
    wait for 10 ns;
    des_sel <= "0101";
    D_data <= x"000e";
    wait for 10 ns;
    des_sel <= "0110";
    D_data <= x"000f";
    wait for 10 ns;
    des_sel <= "0111";
    D_data <= x"0010";
    wait for 10 ns;
    des_sel <= "1000";
    D_data <= x"0011";
    wait for 10 ns;

    -- change A select
    A_sel <= "0000";
    wait for 10 ns;
    A_sel <= "0001";
    wait for 10 ns;
    A_sel <= "0010";
    wait for 10 ns;
    A_sel <= "0011";
    wait for 10 ns;
    A_sel <= "0100";
    wait for 10 ns;
    A_sel <= "0101";
    wait for 10 ns;
    A_sel <= "0110";
    wait for 10 ns;
    A_sel <= "0111";
    wait for 10 ns;
    A_sel <= "1000";
    wait for 10 ns;

    -- change B select
    B_sel <= "0000";
    wait for 10 ns;
    B_sel <= "0001";
    wait for 10 ns;
    B_sel <= "0010";
    wait for 10 ns;
    B_sel <= "0011";
    wait for 10 ns;
    B_sel <= "0100";
    wait for 10 ns;
    B_sel <= "0101";
    wait for 10 ns;
    B_sel <= "0110";
    wait for 10 ns;
    B_sel <= "0111";
    wait for 10 ns;
    B_sel <= "1000";
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
