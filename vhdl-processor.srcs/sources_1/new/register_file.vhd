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

begin


end Behavioral;
