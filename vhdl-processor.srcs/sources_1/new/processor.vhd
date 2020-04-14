----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 10.04.2020 00:16:09
-- Design Name:
-- Module Name: processor - Behavioral
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

entity processor is
  port (clock : in std_logic;
        reset : in std_logic);
end processor;

architecture Behavioral of processor is
  component datapath_16bit is
    port (read_write : in std_logic;
          mux_d : in std_logic;
          function_select : in std_logic_vector (4 downto 0);
          mux_b : in std_logic;
          mux_m : in std_logic;
          b_addr : in std_logic_vector (3 downto 0);
          a_addr : in std_logic_vector (3 downto 0);
          dest_addr : in std_logic_vector (3 downto 0);
          data_in : in std_logic_vector (15 downto 0);
          const_in : in std_logic_vector (15 downto 0);
          pc_in : in std_logic_vector (15 downto 0);
          clock : in std_logic;
          reset : in std_logic;
          V : out std_logic;
          C : out std_logic;
          N : out std_logic;
          Z : out std_logic;
          addr_out : out std_logic_vector (15 downto 0);
          data_out : out std_logic_vector (15 downto 0));
  end component;

  component sign_extend_6to16bit is
    port (input : in std_logic_vector (5 downto 0);
          output : out std_logic_vector (15 downto 0));
  end component;

  component program_counter16bit is
    port (displacement : in std_logic_vector (15 downto 0);
          pc_load : in std_logic;
          pc_increment : in std_logic;
          clock : in std_logic;
          reset : in std_logic;
          addr_out : out std_logic_vector (15 downto 0));
  end component;

  component multiplexer8_1bit is
    port(s : in std_logic_vector(2 downto 0);
         in1 : in std_logic;
         in2 : in std_logic;
         in3 : in std_logic;
         in4 : in std_logic;
         in5 : in std_logic;
         in6 : in std_logic;
         in7 : in std_logic;
         in8 : in std_logic;
         z : out std_logic);
  end component;

  component instruction_register is
    port (clock : in std_logic;
          instruction_load : in std_logic;
          input : in std_logic_vector (15 downto 0);
          opcode : out std_logic_vector (7 downto 0);
          dest_reg : out std_logic_vector (2 downto 0);
          sel_a : out std_logic_vector (2 downto 0);
          sel_b : out std_logic_vector (2 downto 0));
  end component;

  component zero_fill_3to16bit is
    port (input : in std_logic_vector (2 downto 0);
          output : out std_logic_vector (15 downto 0));
  end component;

  component multiplexer2_8bit is
    port(s : in std_logic;
         in1 : in std_logic_vector(7 downto 0);
         in2 : in std_logic_vector(7 downto 0);
         z : out std_logic_vector(7 downto 0));
  end component;

  component CAR8bit is
    port (clock : in std_logic;
          load : in std_logic;
          reset : in std_logic;
          input : in std_logic_vector (7 downto 0);
          addr_out : out std_logic_vector (7 downto 0));
  end component;

  component control_memory256x28bits is
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

  component memory_512x16bits is
    port (address : in std_logic_vector(15 downto 0);
          write_data : in std_logic_vector(15 downto 0);
          mem_write : in std_logic;
          clock : in std_logic;
          read_data : out std_logic_vector(15 downto 0));
  end component;

   signal extender_q, pc_q, memory_m_q, zero_fill_q, addr_out, data_out:
   std_logic_vector(15 downto 0);
   signal next_address, opcode, mux_c_q, car_q : std_logic_vector(7 downto 0);
   signal sign_extend_in : std_logic_vector(5 downto 0);
   signal function_select : std_logic_vector(4 downto 0);
   signal b_addr_in, a_addr_in, dest_addr_in : std_logic_vector(3 downto 0);
   signal dr_q, sa_q, sb_q, mux_s : std_logic_vector(2 downto 0);
   signal mem_write, mux_m, read_write, mux_d, mux_b, temp_b, temp_a, temp_d,
   pc_load, pc_increment, instruction_load, mux_c, v, c, n, z, mux_s_q, not_c,
   not_z : std_logic;

begin

  extender : sign_extend_6to16bit port map (
                                            input => sign_extend_in,
                                            output => extender_q
                                           );

  pc : program_counter16bit port map (
                                      displacement => extender_q,
                                      pc_load => pc_load,
                                      pc_increment => pc_increment,
                                      clock => clock,
                                      reset => reset,
                                      addr_out => pc_q
                                     );

  multiplexer_s : multiplexer8_1bit port map (
                                              s => mux_s,
                                              in1 => '0',
                                              in2 => '1',
                                              in3 => c,
                                              in4 => v,
                                              in5 => z,
                                              in6 => n,
                                              in7 => not_c,
                                              in8 => not_z,
                                              z => mux_s_q
                                             );

  ir : instruction_register port map (
                                      clock => clock,
                                      instruction_load => instruction_load,
                                      input => memory_m_q,
                                      opcode => opcode,
                                      dest_reg => dr_q,
                                      sel_a => sa_q,
                                      sel_b => sb_q
                                     );

  zero_fill : zero_fill_3to16bit port map (
                                            input => sb_q,
                                            output => zero_fill_q
                                          );

  multiplexer_c : multiplexer2_8bit port map (
                                      s => mux_c,
                                      in1 => next_address,
                                      in2 => opcode,
                                      z => mux_c_q
                                     );

  car : CAR8bit port map (
                          clock => clock,
                          load => mux_s_q,
                          reset => reset,
                          input => mux_c_q,
                          addr_out => car_q
                         );

  control_mem : control_memory256x28bits port map (
                                                  mem_write => mem_write,
                                                  mux_m => mux_m,
                                                  read_write => read_write,
                                                  mux_d => mux_d,
                                                  function_select => function_select,
                                                  mux_b => mux_b,
                                                  temp_b => temp_b,
                                                  temp_a => temp_a,
                                                  temp_d => temp_d,
                                                  pc_load => pc_load,
                                                  pc_increment => pc_increment,
                                                  instruction_load => instruction_load,
                                                  mux_c => mux_c,
                                                  mux_s => mux_s,
                                                  next_address => next_address,
                                                  in_car => car_q
                                                 );

  memory_m : memory_512x16bits port map (
                                          address => addr_out,
                                          write_data => data_out,
                                          mem_write => mem_write,
                                          clock => clock,
                                          read_data => memory_m_q
                                        );

  datapath : datapath_16bit port map (
                                      read_write => read_write,
                                      mux_d => mux_d,
                                      function_select => function_select,
                                      mux_b => mux_b,
                                      mux_m => mux_m,
                                      b_addr => b_addr_in,
                                      a_addr => a_addr_in,
                                      dest_addr => dest_addr_in,
                                      data_in => memory_m_q,
                                      const_in => zero_fill_q,
                                      pc_in => pc_q,
                                      clock => clock,
                                      reset => reset,
                                      V => v,
                                      C => c,
                                      N => n,
                                      Z => z,
                                      addr_out => addr_out,
                                      data_out => data_out
                                     );

  sign_extend_in <= dr_q & sb_q;
  not_c <= not c;
  not_z <= not z;
  b_addr_in <= temp_b & sb_q;
  a_addr_in <= temp_a & sa_q;
  dest_addr_in <= temp_d & dr_q;

end Behavioral;
