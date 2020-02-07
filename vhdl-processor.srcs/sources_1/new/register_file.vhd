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

   signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5,
   load_reg6, load_reg7 : std_logic;
   signal src_reg, data_src_mux_out, reg0_q, reg1_q, reg2_q, reg3_q, reg4_q,
   reg5_q, reg6_q, reg7_q : std_logic_vector (15 downto 0);
begin
   des_decoder_3to8 : decoder_3to8 port map (
                                               A => des_A,
                                               Q(0) => load_reg0,
                                               Q(1) => load_reg1,
                                               Q(2) => load_reg2,
                                               Q(3) => load_reg3,
                                               Q(4) => load_reg4,
                                               Q(5) => load_reg5,
                                               Q(6) => load_reg6,
                                               Q(7) => load_reg7
                                            );

   data_src_multiplexer2_16bit : multiplexer2_16bit port map (
                                                               s => data_src,
                                                               in1 => data,
                                                               in2 => src_reg,
                                                               z => data_src_mux_out
                                                             );

   reg00 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg0,
                           Clk => Clk,
                           Q => reg0_q
                         );

   reg01 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg1,
                           Clk => Clk,
                           Q => reg1_q
                         );

   reg02 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg2,
                           Clk => Clk,
                           Q => reg2_q
                         );

   reg03 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg3,
                           Clk => Clk,
                           Q => reg3_q
                         );

   reg04 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg4,
                           Clk => Clk,
                           Q => reg4_q
                         );

   reg05 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg5,
                           Clk => Clk,
                           Q => reg5_q
                         );

   reg06 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg6,
                           Clk => Clk,
                           Q => reg6_q
                         );

   reg07 : reg16 port map (
                           D => data_src_mux_out,
                           load => load_reg7,
                           Clk => Clk,
                           Q => reg7_q
                         );

   src_reg_multiplexer8_16bit : multiplexer8_16bit port map (
                                                               s => src_s,
                                                               in1 => reg0_q,
                                                               in2 => reg1_q,
                                                               in3 => reg2_q,
                                                               in4 => reg3_q,
                                                               in5 => reg4_q,
                                                               in6 => reg5_q,
                                                               in7 => reg6_q,
                                                               in8 => reg7_q,
                                                               z => src_reg
                                                            );
   reg0 <= reg0_q;
   reg1 <= reg1_q;
   reg2 <= reg2_q;
   reg3 <= reg3_q;
   reg4 <= reg4_q;
   reg5 <= reg5_q;
   reg6 <= reg6_q;
   reg7 <= reg7_q;

end Behavioral;
