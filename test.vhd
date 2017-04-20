----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2017 10:38:45 PM
-- Design Name: 
-- Module Name: test - Behavioral
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
use IEEE. STD_LOGIC_SIGNED.ALL;
use IEEE. STD_LOGIC_ARITH.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
--  Port ( );
end test;

architecture Behavioral of test is

constant CLK_PERIOD : TIME := 10 ns;
signal clk: std_logic := '0';
signal rst: std_logic := '0';
signal start: std_logic := '0';
signal x: std_logic_vector(15 downto 0) := (others => '0');
signal y: std_logic_vector(7 downto 0):= (others => '0');
   
signal a:std_logic_vector(7 downto 0);
signal q: std_logic_vector(7 downto 0);
signal term: std_logic;
  
begin

gen_clk: process
 begin
    clk <= '0';
    wait for (CLK_PERIOD/2);
    clk <= '1';
    wait for (CLK_PERIOD/2);
 end process gen_clk;


DUT: entity WORK.impartire port map(clk, rst, start, x,y, a, q, term);

test: process
      begin
      
        start<='0';
                   Rst <= '1';
                   wait for CLK_PERIOD;
                   Rst <= '0';
                   wait for CLK_PERIOD;
                       
                   x <= "0000000000001010";
                   y <= "00000010";
                   wait for 10 ns;
                             
                   start <= '1';
                   wait for 1000ns;
                        
end process test;

end Behavioral;
