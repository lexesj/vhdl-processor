----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 06.02.2020 22:18:29
-- Design Name:
-- Module Name: register_file - Behavioral
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

entity register_file is
   port(src_s : in std_logic_vector (2 downto 0);
        des_A : in std_logic_vector (2 downto 0);
        Clk : in std_logic;
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
end register_file;

architecture Behavioral of register_file is
   component decoder_3to8 is
      port(A : in std_logic_vector(2 downto 0);
           Q : out std_logic_vector(7 downto 0));
   end component;

   component multiplexer2_16bit is
      port(s : in std_logic;
           in1 : in std_logic_vector(15 downto 0);
           in2 : in std_logic_vector(15 downto 0);
           z : out std_logic_vector(15 downto 0));
   end component;

   component reg16 is
      port(D : in std_logic_vector(15 downto 0);
      load, Clk : in std_logic;
      Q : out std_logic_vector(15 downto 0));
   end component;

   component multiplexer8_16bit is
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
begin


end Behavioral;
