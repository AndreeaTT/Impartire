----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2017 10:24:09 AM
-- Design Name: 
-- Module Name: bistabilsincron - Behavioral
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

entity bistabilsincron is
 
  Port ( 
   clk: in std_logic;
   ce : in std_logic;
   rst: in std_logic;
   d: in std_logic;
   q: out std_logic
  );
end bistabilsincron;

architecture Behavioral of bistabilsincron is

begin
    
   gen_bistabil:process(clk)
                begin
                if rising_edge(clk) then
                   if (rst = '1') then
                       q <= '0';
                   end if;
                   
                   if (ce = '1') then
                       q <= d;
                   end if;
               end if;
   end process gen_bistabil;

end Behavioral;
