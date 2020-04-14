----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 22:54:40
-- Design Name: 
-- Module Name: program_counter16bit - Behavioral
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

entity program_counter16bit is
  port (displacement : in std_logic_vector (15 downto 0);
        pc_load : in std_logic;
        pc_increment : in std_logic;
        clock : in std_logic;
        reset : in std_logic;
        addr_out : out std_logic_vector (15 downto 0));
end program_counter16bit;

architecture Behavioral of program_counter16bit is
  component ALU_16bit is
    port (A : in std_logic_vector (15 downto 0);
          B : in std_logic_vector (15 downto 0);
          c_in : in std_logic;
          S : in std_logic_vector (2 downto 0);
          G : out std_logic_vector (15 downto 0);
          c_out : out std_logic);
  end component;

  signal curr_address, alu_q: std_logic_vector (15 downto 0);
  signal sel: std_logic_vector (3 downto 0);

  constant gate_delay: time := 1 ns;
begin
  alu : ALU_16bit port map (
                            A => curr_address,
                            B => displacement,
                            c_in => sel(0),
                            S => sel(3 downto 1),
                            G => alu_q
                           );

  addr_out <= curr_address;

  process(clock, reset)
  begin
    if pc_load='1' and pc_increment='0' then
      sel <= x"2" after gate_delay;
    elsif pc_load='0' and pc_increment='1' then
      sel <= x"1" after gate_delay;
    elsif pc_load='0' and pc_increment='0' then
      sel <= x"0" after gate_delay;
    end if;
    if(rising_edge(clock)) then
      if reset='1' then
        curr_address <= x"0000" after gate_delay;
        sel <= x"0" after gate_delay;
      else
        curr_address <= alu_q after gate_delay;
      end if;
    end if;
  end process;
end Behavioral;
