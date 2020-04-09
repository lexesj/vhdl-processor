----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 22:40:28
-- Design Name: 
-- Module Name: control_memory256x28bits_tb - Behavioral
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

entity control_memory256x28bits_tb is
end control_memory256x28bits_tb;

architecture bench of control_memory256x28bits_tb is

  component control_memory256x28bits
    port(mem_write : out std_logic;
         mux_m : out std_logic;
         read_write : out std_logic;
         mux_d : out std_logic;
         function_select : out std_logic_vector(4 downto 0);
         mux_b : out std_logic;
         temp_b : out std_logic;
         temp_a : out std_logic;
         temp_d : out std_logic;
         pc_load : out std_logic;
         pc_increment : out std_logic;
         instruction_load : out std_logic;
         mux_c : out std_logic;
         mux_s : out std_logic_vector(2 downto 0);
         next_address : out std_logic_vector(7 downto 0);
         in_car : in std_logic_vector(7 downto 0));
  end component;

  signal mem_write: std_logic;
  signal mux_m: std_logic;
  signal read_write: std_logic;
  signal mux_d: std_logic;
  signal function_select: std_logic_vector(4 downto 0);
  signal mux_b: std_logic;
  signal temp_b: std_logic;
  signal temp_a: std_logic;
  signal temp_d: std_logic;
  signal pc_load: std_logic;
  signal pc_increment: std_logic;
  signal instruction_load: std_logic;
  signal mux_c: std_logic;
  signal mux_s: std_logic_vector(2 downto 0);
  signal next_address: std_logic_vector(7 downto 0);
  signal in_car: std_logic_vector(7 downto 0);

  constant wait_delay: time := 10 ns;
begin

  uut: control_memory256x28bits port map ( mem_write        => mem_write,
                                           mux_m            => mux_m,
                                           read_write       => read_write,
                                           mux_d            => mux_d,
                                           function_select  => function_select,
                                           mux_b            => mux_b,
                                           temp_b           => temp_b,
                                           temp_a           => temp_a,
                                           temp_d           => temp_d,
                                           pc_load          => pc_load,
                                           pc_increment     => pc_increment,
                                           instruction_load => instruction_load,
                                           mux_c            => mux_c,
                                           mux_s            => mux_s,
                                           next_address     => next_address,
                                           in_car           => in_car );

  stimulus: process
  begin
  
    -- initialisation code
    in_car <= x"00";

    -- test bench stimulus code
    wait for wait_delay;

    wait;
  end process;


end;
