----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 09:38:41 PM
-- Design Name: 
-- Module Name: leftLogicalShift - Behavioral
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

entity leftLogicalShift is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end leftLogicalShift;

architecture Behavioral of leftLogicalShift is

begin
    y(0) <= '0';
    y(1) <= a(0);
    y(2) <= a(1);
    y(3) <= a(2);
    y(4) <= a(3);
    y(5) <= a(4);
    y(6) <= a(5);
    y(7) <= a(6);
    y(8) <= a(7);
    y(9) <= a(8);
    y(10) <= a(9);
    y(11) <= a(10);
    y(12) <= a(11);
    y(13) <= a(12);
    y(14) <= a(13);
    y(15) <= a(14);

end Behavioral;
