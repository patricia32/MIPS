----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 09:08:04 PM
-- Design Name: 
-- Module Name: XORgate_16bit - Behavioral
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

entity XORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end XORgate_16bit;

architecture Behavioral of XORgate_16bit is
begin
    
    y(0) <= a(0) xor b(0);
    y(1) <= a(1) xor b(1);
    y(2) <= a(2) xor b(2);
    y(3) <= a(3) xor b(3);
    y(4) <= a(4) xor b(4);
    y(5) <= a(5) xor b(5);
    y(6) <= a(6) xor b(6);
    y(7) <= a(7) xor b(7);
    y(8) <= a(8) xor b(8);
    y(9) <= a(9) xor b(9);
    y(10) <= a(10) xor b(10);
    y(11) <= a(11) xor b(11);
    y(12) <= a(12) xor b(12);
    y(13) <= a(13) xor b(13);
    y(14) <= a(14) xor b(14);
    y(15) <= a(15) xor b(15);

end Behavioral;
