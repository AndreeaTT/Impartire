----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2017 11:36:19 AM
-- Design Name: 
-- Module Name: inmultire - Behavioral
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

entity impartire is
  generic(n:natural := 8);
  Port (
   clk: in std_logic;
   rst: in std_logic;
   start: in std_logic;
   x: in std_logic_vector(2*n-1 downto 0);
   y: in std_logic_vector(n-1 downto 0);
   
   a:out std_logic_vector(n-1 downto 0);
   q:out std_logic_vector(n-1 downto 0);
   term: out std_logic
   );
end impartire;

architecture Behavioral of impartire is
signal q_load, q_perm: std_logic_vector(n-1 downto 0) := (others => '0');
signal loadq, loadb, subb, ovf, tout, shlaq , loada, term_aux:std_logic := '0';
signal b_load, a_load, b_temp, a_sum, a_perm: std_logic_vector(n downto 0) :=(others => '0');


begin

q_perm <= x(n-1 downto 0) when loadb = '1' else q_load(n-1 downto 1) & not a_load(n);
a_perm <= '0' & x(2*n-1 downto n) when loadb = '1' else a_sum;

impartitor: entity WORK.registrusincron generic map(n => 9)
                                        port map('0' & y, loadb, clk, rst, b_load);
                                  
dut2: entity WORK.addn generic map(n => 9)
                       port map(a_load, b_temp, subb, a_sum, tout, ovf);
                       
dut3: entity WORK.srrn generic map(n => 8)
                       port map(clk, q_perm, '0', rst, loadq, shlaq, q_load);
                       
dut4: entity WORK.srrn generic map(n => 9)
                       port map(clk, a_perm, q_load(n-1), rst, loada, shlaq, a_load);
                                 
dut6: entity WORK.control generic map(n => 8)
                        port map(clk, rst, start, a_perm(n-1), term_aux, loadb, loadq, shlaq, subb, loada);
   
gen: for i in 0 to n generate
    b_temp(i) <= b_load(i) xor subb;
end generate gen;
   
reza: entity WORK.registrusincron generic map(n => 8)
                                  port map(a_load(n-1 downto 0), term_aux, clk, rst, a);

rezq: entity WORK.registrusincron generic map(n => 8)
                                  port map(q_load, term_aux, clk, rst, q);
                  
term <= term_aux;

end Behavioral;
