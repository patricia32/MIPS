----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 09:08:04 PM
-- Design Name: 
-- Module Name: ORgate_16bit - Behavioral
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

entity ORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end ORgate_16bit;

architecture Behavioral of ORgate_16bit is
begin
    
    y(0) <= a(0) OR b(0);
    y(1) <= a(1) OR b(1);
    y(2) <= a(2) OR b(2);
    y(3) <= a(3) OR b(3);
    y(4) <= a(4) OR b(4);
    y(5) <= a(5) OR b(5);
    y(6) <= a(6) OR b(6);
    y(7) <= a(7) OR b(7);
    y(8) <= a(8) OR b(8);
    y(9) <= a(9) OR b(9);
    y(10) <= a(10) OR b(10);
    y(11) <= a(11) OR b(11);
    y(12) <= a(12) OR b(12);
    y(13) <= a(13) OR b(13);
    y(14) <= a(14) OR b(14);
    y(15) <= a(15) OR b(15);

end Behavioral;
