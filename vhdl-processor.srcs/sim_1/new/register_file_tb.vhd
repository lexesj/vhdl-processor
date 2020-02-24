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
     port(src_s0, src_s1, src_s2 : in std_logic;
          des_A0, des_A1, des_A2 : in std_logic;
          Clk : in std_logic;
          load_enable: in std_logic;
          data_src : in std_logic;
          data : in std_logic_vector (15 downto 0);
          reg0 : out std_logic_vector (15 downto 0);
          reg1 : out std_logic_vector (15 downto 0);
          reg2 : out std_logic_vector (15 downto 0);
          reg3 : out std_logic_vector (15 downto 0);
          reg4 : out std_logic_vector (15 downto 0);
          reg5 : out std_logic_vector (15 downto 0);
          reg6 : out std_logic_vector (15 downto 0);
          reg7 : out std_logic_vector (15 downto 0));
  end component;

  signal src_s0, src_s1, src_s2: std_logic;
  signal des_A0, des_A1, des_A2: std_logic;
  signal Clk: std_logic;
  signal load_enable: std_logic;
  signal data_src: std_logic;
  signal data: std_logic_vector (15 downto 0);
  signal reg0: std_logic_vector (15 downto 0);
  signal reg1: std_logic_vector (15 downto 0);
  signal reg2: std_logic_vector (15 downto 0);
  signal reg3: std_logic_vector (15 downto 0);
  signal reg4: std_logic_vector (15 downto 0);
  signal reg5: std_logic_vector (15 downto 0);
  signal reg6: std_logic_vector (15 downto 0);
  signal reg7: std_logic_vector (15 downto 0);

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  uut: register_file port map ( src_s0      => src_s0,
                                src_s1      => src_s1,
                                src_s2      => src_s2,
                                des_A0      => des_A0,
                                des_A1      => des_A1,
                                des_A2      => des_A2,
                                Clk         => Clk,
                                load_enable => load_enable,
                                data_src    => data_src,
                                data        => data,
                                reg0        => reg0,
                                reg1        => reg1,
                                reg2        => reg2,
                                reg3        => reg3,
                                reg4        => reg4,
                                reg5        => reg5,
                                reg6        => reg6,
                                reg7        => reg7 );

  stimulus: process
  begin

    -- initialisation code

    -- load disabled ----------------------------------------------------------

    load_enable <= '0';

    src_s2 <= '0';
    src_s1 <= '0';
    src_s0 <= '0';

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';

    data_src <= '0';
    data <= "1010101010101010";

    -- test bench stimulus code

    -- load data into each register

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    -- reset data to 0 in each register

    data <= "0000000000000000";

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    -- load data into register 0

    data <= "0000010000101101";

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';


    wait for 10 ns;

    data <= "0000000000000000";

    -- move data from register 0 to all other registers

    data_src <= '1';

    src_s2 <= '0';
    src_s1 <= '0';
    src_s0 <= '0';

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    -- load enabled ----------------------------------------------------------

    load_enable <= '1';

    src_s2 <= '0';
    src_s1 <= '0';
    src_s0 <= '0';

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';

    data_src <= '0';
    data <= "1010101010101010";

    -- test bench stimulus code

    -- load data into each register

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    -- reset data to 0 in each register

    data <= "0000000000000000";

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    -- load data into register 0

    data <= "0000010000101101";

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '0';


    wait for 10 ns;

    data <= "0000000000000000";

    -- move data from register 0 to all other registers

    data_src <= '1';

    src_s2 <= '0';
    src_s1 <= '0';
    src_s0 <= '0';

    des_A2 <= '0';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '0';
    des_A1 <= '1';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '0';
    des_A0 <= '1';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '0';

    wait for 10 ns;

    des_A2 <= '1';
    des_A1 <= '1';
    des_A0 <= '1';

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
