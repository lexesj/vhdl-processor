----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.04.2020 23:46:07
-- Design Name: 
-- Module Name: CAR8bit - Behavioral
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

entity CAR8bit is
  port (clock : in std_logic;
        load : in std_logic;
        reset : in std_logic;
        input : in std_logic_vector (7 downto 0);
        addr_out : out std_logic_vector (7 downto 0));
end CAR8bit;

architecture Behavioral of CAR8bit is
  component ALU_16bit is
    port (A : in std_logic_vector (15 downto 0);
          B : in std_logic_vector (15 downto 0);
          c_in : in std_logic;
          S : in std_logic_vector (2 downto 0);
          G : out std_logic_vector (15 downto 0);
          c_out : out std_logic);
  end component;

  signal alu_q: std_logic_vector (15 downto 0);
  signal curr_address: std_logic_vector (7 downto 0);
  signal sel: std_logic_vector (3 downto 0);

  constant gate_delay: Time := 1 ns;
begin
  alu : ALU_16bit port map (
                            A => x"00" & curr_address,
                            B => x"0000",
                            c_in => sel(0),
                            S => sel(3 downto 1),
                            G => alu_q
                           );

  sel <= x"1"; -- always increment
  addr_out <= curr_address;

  process(clock, reset)
  begin
    if(rising_edge(clock)) then
      if reset='1' then
        curr_address <= x"00" after gate_delay;
      else
        if load = '1' then
          curr_address <= input after gate_delay;
        else
          curr_address <= alu_q(7 downto 0) after gate_delay;
        end if;
      end if;
    end if;
  end process;
end Behavioral;
