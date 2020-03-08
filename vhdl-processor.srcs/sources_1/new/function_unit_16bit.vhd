----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 08.03.2020 04:24:47
-- Design Name:
-- Module Name: function_unit_16bit - Behavioral
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

entity function_unit_16bit is
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
end function_unit_16bit;

architecture Behavioral of function_unit_16bit is
   component ALU_16bit is
      port (A : in std_logic_vector (15 downto 0);
            B : in std_logic_vector (15 downto 0);
            c_in : in std_logic;
            S : in std_logic_vector (2 downto 0);
            G : out std_logic_vector (15 downto 0);
            c_out : out std_logic);
   end component;

   component shift_unit_16bit is
      port (B : in std_logic_vector (15 downto 0);
            I : in std_logic_vector (1 downto 0);
            S : in std_logic_vector (1 downto 0);
            H : out std_logic_vector (15 downto 0));
   end component;

   component multiplexer2_16bit is
      port(s : in std_logic;
           in1 : in std_logic_vector(15 downto 0);
           in2 : in std_logic_vector(15 downto 0);
           z : out std_logic_vector(15 downto 0));
   end component;

   signal alu_q, su_q : std_logic_vector(15 downto 0);
begin
   ALU : ALU_16bit port map (
                              A => A,
                              B => B,
                              c_in => G_sel(0),
                              S(0) => G_sel(1),
                              S(1) => G_sel(2),
                              S(2) => G_sel(3),
                              G => alu_q,
                              c_out => C
                            );

   su : shift_unit_16bit port map (
                                    B => B,
                                    I => "00",
                                    S => H_sel,
                                    H => su_q
                                  );

   mux : multiplexer2_16bit port map (
                                       s => MF_sel,
                                       in1 => alu_q,
                                       in2 => su_q,
                                       z => F
                                     );

   V <= ((A(15) and B(15) and not alu_q(15)) or (not A(15) and not B(15) and
        alu_q(15)));
   N <= alu_q(15);
   Z <= not (alu_q(0) or alu_q(1) or alu_q(2) or alu_q(3) or alu_q(4) or
        alu_q(5) or alu_q(6) or alu_q(7) or alu_q(8) or alu_q(9) or alu_q(10)
        or alu_q(11) or alu_q(12) or alu_q(13) or alu_q(14) or alu_q(15));

end Behavioral;
