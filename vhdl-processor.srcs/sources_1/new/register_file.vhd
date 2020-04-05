----------------------------------------------------------------------------------
-- Company: Trinity College Dublin
-- Engineer: Lexes Jan Mantiquilla
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
   port(
        Clk : in std_logic;
        load_enable: in std_logic;
        A_sel : in std_logic_vector (3 downto 0);
        B_sel : in std_logic_vector (3 downto 0);
        des_sel : in std_logic_vector (3 downto 0);
        D_data : in std_logic_vector (15 downto 0);
        A_data : out std_logic_vector (15 downto 0);
        B_data : out std_logic_vector (15 downto 0));
end register_file;

architecture Behavioral of register_file is
   component decoder_4to9 is
      port(A : in std_logic_vector(3 downto 0);
           Q : out std_logic_vector(8 downto 0));
   end component;

   component reg16 is
      port(D : in std_logic_vector(15 downto 0);
      load, Clk : in std_logic;
      Q : out std_logic_vector(15 downto 0));
   end component;

   component multiplexer9_16bit is
      port(s : in std_logic_vector(3 downto 0);
           in1 : in std_logic_vector(15 downto 0);
           in2 : in std_logic_vector(15 downto 0);
           in3 : in std_logic_vector(15 downto 0);
           in4 : in std_logic_vector(15 downto 0);
           in5 : in std_logic_vector(15 downto 0);
           in6 : in std_logic_vector(15 downto 0);
           in7 : in std_logic_vector(15 downto 0);
           in8 : in std_logic_vector(15 downto 0);
           in9 : in std_logic_vector(15 downto 0);
           z : out std_logic_vector(15 downto 0));
   end component;

   signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5,
   load_reg6, load_reg7, load_reg8 : std_logic;
   signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q,
   reg8_q : std_logic_vector (15 downto 0);
   signal enable_reg_in : std_logic_vector (8 downto 0);
begin
   load_reg0 <= load_enable and enable_reg_in(0);
   load_reg1 <= load_enable and enable_reg_in(1);
   load_reg2 <= load_enable and enable_reg_in(2);
   load_reg3 <= load_enable and enable_reg_in(3);
   load_reg4 <= load_enable and enable_reg_in(4);
   load_reg5 <= load_enable and enable_reg_in(5);
   load_reg6 <= load_enable and enable_reg_in(6);
   load_reg7 <= load_enable and enable_reg_in(7);
   load_reg8 <= load_enable and enable_reg_in(8);

   des_decoder_4to9 : decoder_4to9 port map (
                                               A => des_sel,
                                               Q(0) => enable_reg_in(0),
                                               Q(1) => enable_reg_in(1),
                                               Q(2) => enable_reg_in(2),
                                               Q(3) => enable_reg_in(3),
                                               Q(4) => enable_reg_in(4),
                                               Q(5) => enable_reg_in(5),
                                               Q(6) => enable_reg_in(6),
                                               Q(7) => enable_reg_in(7),
                                               Q(8) => enable_reg_in(8)
                                            );

   reg00 : reg16 port map (
                           D => D_data,
                           load => load_reg0,
                           Clk => Clk,
                           Q => reg0_q
                         );

   reg01 : reg16 port map (
                           D => D_data,
                           load => load_reg1,
                           Clk => Clk,
                           Q => reg1_q
                         );

   reg02 : reg16 port map (
                           D => D_data,
                           load => load_reg2,
                           Clk => Clk,
                           Q => reg2_q
                         );

   reg03 : reg16 port map (
                           D => D_data,
                           load => load_reg3,
                           Clk => Clk,
                           Q => reg3_q
                         );

   reg04 : reg16 port map (
                           D => D_data,
                           load => load_reg4,
                           Clk => Clk,
                           Q => reg4_q
                         );

   reg05 : reg16 port map (
                           D => D_data,
                           load => load_reg5,
                           Clk => Clk,
                           Q => reg5_q
                         );

   reg06 : reg16 port map (
                           D => D_data,
                           load => load_reg6,
                           Clk => Clk,
                           Q => reg6_q
                         );

   reg07 : reg16 port map (
                           D => D_data,
                           load => load_reg7,
                           Clk => Clk,
                           Q => reg7_q
                         );

   reg08 : reg16 port map (
                           D => D_data,
                           load => load_reg8,
                           Clk => Clk,
                           Q => reg8_q
                         );


   a_sel_mux : multiplexer9_16bit port map (
                                             s => A_sel,
                                             in1 => reg0_q,
                                             in2 => reg1_q,
                                             in3 => reg2_q,
                                             in4 => reg3_q,
                                             in5 => reg4_q,
                                             in6 => reg5_q,
                                             in7 => reg6_q,
                                             in8 => reg7_q,
                                             in9 => reg8_q,
                                             z => A_data
                                           );

   b_sel_mux : multiplexer9_16bit port map (
                                             s => B_sel,
                                             in1 => reg0_q,
                                             in2 => reg1_q,
                                             in3 => reg2_q,
                                             in4 => reg3_q,
                                             in5 => reg4_q,
                                             in6 => reg5_q,
                                             in7 => reg6_q,
                                             in8 => reg7_q,
                                             in9 => reg8_q,
                                             z => B_data
                                           );

end Behavioral;
