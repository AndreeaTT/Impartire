----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2017 10:40:45 AM
-- Design Name: 
-- Module Name: addn - Behavioral
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

entity addn is
    generic (n: natural);
    port (a, b: in std_logic_vector (n-1 downto 0);
    cin: in std_logic;
    s: out std_logic_vector (n-1 downto 0);
    cout: out std_logic;
    ovf: out std_logic
    );
end addn;

architecture Behavioral of addn is

begin

process (a, b, cin)
 variable c: std_logic;
 variable c_1: std_logic;
 begin
    c := cin;
 for i in 0 to n-1 loop
    s(i) <= a(i) xor b(i) xor c;
    c_1:=c;
    c := (a(i) and b(i)) or (a(i) and c) or (b(i) and c);
 end loop;
 cout <= c;
 ovf <= c xor c_1;
 end process;

end Behavioral;
