----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 09:08:04 PM
-- Design Name: 
-- Module Name: NANDgate_16bit - Behavioral
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

entity NANDgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end NANDgate_16bit;

architecture Behavioral of NANDgate_16bit is
begin
    
    y(0) <= a(0) NAND b(0);
    y(1) <= a(1) NAND b(1);
    y(2) <= a(2) NAND b(2);
    y(3) <= a(3) NAND b(3);
    y(4) <= a(4) NAND b(4);
    y(5) <= a(5) NAND b(5);
    y(6) <= a(6) NAND b(6);
    y(7) <= a(7) NAND b(7);
    y(8) <= a(8) NAND b(8);
    y(9) <= a(9) NAND b(9);
    y(10) <= a(10) NAND b(10);
    y(11) <= a(11) NAND b(11);
    y(12) <= a(12) NAND b(12);
    y(13) <= a(13) NAND b(13);
    y(14) <= a(14) NAND b(14);
    y(15) <= a(15) NAND b(15);

end Behavioral;
