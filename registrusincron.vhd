----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2017 10:15:19 AM
-- Design Name: 
-- Module Name: registrusincron - Behavioral
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

entity registrusincron is
  generic(n: natural);
  Port (
   D: in std_logic_vector(n-1 downto 0);
   ce: in std_logic;
   clk: in std_logic;
   rst: in std_logic;
   q: out std_logic_vector(n-1 downto 0)
   );
end registrusincron;

architecture Behavioral of registrusincron is

begin

gen_shift:process(clk)
          begin
            if rising_edge(clk) then
                if (rst = '1') then
                    q <= (others => '0');
                end if;
                
                if (ce = '1') then
                    q <= d;
                end if;
            end if;
          end process gen_shift;

end Behavioral;
