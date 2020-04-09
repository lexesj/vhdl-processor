----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 15:55:48
-- Design Name:
-- Module Name: datapath_16bit - Behavioral
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

entity datapath_16bit is
   port (read_write : in std_logic;
         mux_d : in std_logic;
         function_select : in std_logic_vector (4 downto 0);
         mux_b : in std_logic;
         b_addr : in std_logic_vector (3 downto 0);
         a_addr : in std_logic_vector (3 downto 0);
         dest_addr : in std_logic_vector (3 downto 0);
         data_in : in std_logic_vector (15 downto 0);
         const_in : in std_logic_vector (15 downto 0);
         clock : in std_logic;
         V : out std_logic;
         C : out std_logic;
         N : out std_logic;
         Z : out std_logic;
         addr_out : out std_logic_vector (15 downto 0);
         data_out : out std_logic_vector (15 downto 0));
end datapath_16bit;

architecture Behavioral of datapath_16bit is
   component register_file is
      port(
             Clk : in std_logic;
             load_enable: in std_logic;
             A_sel : in std_logic_vector (3 downto 0);
             B_sel : in std_logic_vector (3 downto 0);
             des_sel : in std_logic_vector (3 downto 0);
             D_data : in std_logic_vector (15 downto 0);
             A_data : out std_logic_vector (15 downto 0);
             B_data : out std_logic_vector (15 downto 0));
   end component;

   component function_unit_16bit is
      port (A : in std_logic_vector (15 downto 0);
            B : in std_logic_vector (15 downto 0);
            F : out std_logic_vector (15 downto 0);
            H_sel : in std_logic_vector (1 downto 0);
            G_sel : in std_logic_vector (3 downto 0);
            MF_sel : in std_logic;
            V : out std_logic;
            C : out std_logic;
            N : out std_logic;
            Z : out std_logic);
   end component;

   component multiplexer2_16bit is
      port(s : in std_logic;
           in1 : in std_logic_vector(15 downto 0);
           in2 : in std_logic_vector(15 downto 0);
           z : out std_logic_vector(15 downto 0));
   end component;

   signal bus_d, bus_a, bus_b0, bus_b1, funct_u_q: std_logic_vector(15 downto
   0);
begin

   reg_file : register_file port map (
                                        Clk => clock,
                                        load_enable => read_write,
                                        A_sel => a_addr,
                                        B_sel => b_addr,
                                        des_sel => dest_addr,
                                        D_data => bus_d,
                                        A_data => bus_a,
                                        B_data => bus_b0
                                     );

   funct_u : function_unit_16bit port map (
                                             A => bus_a,
                                             B => bus_b1,
                                             F => funct_u_q,
                                             G_sel(0) => function_select(0),
                                             G_sel(1) => function_select(1),
                                             G_sel(2) => function_select(2),
                                             G_sel(3) => function_select(3),
                                             MF_sel => function_select(4),
                                             H_sel(0) => function_select(2),
                                             H_sel(1) => function_select(3),
                                             V => V,
                                             C => C,
                                             N => N,
                                             Z => Z
                                          );

   multiplex_b : multiplexer2_16bit port map (
                                                s => mux_b,
                                                in1 => bus_b0,
                                                in2 => const_in,
                                                z => bus_b1
                                             );

   multiplex_d : multiplexer2_16bit port map (
                                                s => mux_d,
                                                in1 => funct_u_q,
                                                in2 => data_in,
                                                z => bus_d
                                             );

   addr_out <= bus_a;
   data_out <= bus_b1;

end Behavioral;
