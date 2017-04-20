----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2017 10:53:11 AM
-- Design Name: 
-- Module Name: booth - Behavioral
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

entity control is
  generic(n: natural);
  Port (
  clk:in std_logic;
  rst:in std_logic;
  start:in std_logic;
  an: in std_logic;
  
  term:out std_logic;
  loadb:out std_logic;
  loadq: out std_logic;
  shlaq: out std_logic;
  subb:out std_logic;
  loada:out std_logic
  );
end control;

architecture Behavioral of control is

type tip_stare is (idle, init,shift, test, sub, add, decrm, result);
signal stare: tip_stare;
signal c:natural;

begin
proc1:  process(clk,rst, start, an)
        begin
          if rising_edge(clk) then
            if (rst = '1') then
                stare <= idle;
                term <= '-';
                loadb <= '-';
                loadq <= '-';
                subb <= '-';
                loada <= '-';
                shlaq <= '-';
            else
                case stare is
                    when idle => 
                          term <= '0';
                          loadb <= '0';
                          loadq <= '0';
                          subb <= '0';
                          loada <= '0';
                          shlaq <= '0';
                         
                         if (start = '1') then
                            stare <= init;
                         else
                            stare <= idle;
                         end if; 
                         
                  when init => 
                         term <= '0';
                         loadb <= '1';
                         loadq <= '1';
                         subb <= '0';
                         loada <= '1';
                         shlaq <= '0';
                         c <= n;
                         stare <= shift;
                         
                  when shift => 
                         term <= '0';
                         loadb <= '0';
                         loadq <= '0';
                         subb <= '0';
                         loada <= '0';
                         shlaq <= '1';
                         stare <= sub;
                      
                  when test => 
                         term <= '0';
                         loadb <= '0';
                         loadq <= '1';
                         subb <= '0';
                         loada <= '0';
                         shlaq <= '0'; 
                                                  
                         if (an = '1') then
                             stare <= add;
                         else
                             stare <= decrm; 
                         end if;
                       
                  when add => 
                            term <= '0';
                            loadb <= '0';
                            loadq <= '0';
                            subb <= '0';
                            loada <= '1';
                            shlaq <= '0'; 
                                                  
                            stare <= decrm;
                            
                 when sub => 
                            term <= '0';
                            loadb <= '0';
                            loadq <= '0';
                            subb <= '1';
                            loada <= '1';
                            shlaq <= '0';
                            
                            stare <= test;
                            
                 when decrm => 
                            term <= '0';
                            loadb <= '0';
                            loadq <= '0';
                            subb <= '0';
                            loada <= '0';
                            shlaq <= '0'; 
                            c <= c-1;    
                                                     
                            if (c > 1) then
                                stare <= shift;
                            else
                                stare <= result;
                            end if;  
                           
                  when result => 
                             term <= '1';
                             loadb <= '0';
                             loadq <= '0';
                             subb <= '0';
                             loada <= '0';
                             shlaq <= '0';
                             stare <= idle;
             end case;
                                                                               
            end if;
         end if;
end process proc1;
end Behavioral;
