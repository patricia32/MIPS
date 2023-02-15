----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/24/2022 09:08:04 PM
-- Design Name: 
-- Module Name: NXORgate_16bit - Behavioral
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

entity NXORgate_16bit is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end NXORgate_16bit;

architecture Behavioral of NXORgate_16bit is
SIGNAL y1: STD_LOGIC_VECTOR (15 downto 0);

component NOTgate_16biti is
    Port ( a : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           y : out STD_LOGIC_VECTOR(15 DOWNTO 0));
end component;
signal NOTb, FINALb: STD_LOGIC_VECTOR (15 downto 0);
   
begin
    
    y1(0) <= a(0) XOR b(0);
    y1(1) <= a(1) XOR b(1);
    y1(2) <= a(2) XOR b(2);
    y1(3) <= a(3) XOR b(3);
    y1(4) <= a(4) XOR b(4);
    y1(5) <= a(5) XOR b(5);
    y1(6) <= a(6) XOR b(6);
    y1(7) <= a(7) XOR b(7);
    y1(8) <= a(8) XOR b(8);
    y1(9) <= a(9) XOR b(9);
    y1(10) <= a(10) XOR b(10);
    y1(11) <= a(11) XOR b(11);
    y1(12) <= a(12) XOR b(12);
    y1(13) <= a(13) XOR b(13);
    y1(14) <= a(14) XOR b(14);
    y1(15) <= a(15) XOR b(15);
    
     NOTpm: NOTgate_16biti port map(Y1, Y);
    

end Behavioral;
