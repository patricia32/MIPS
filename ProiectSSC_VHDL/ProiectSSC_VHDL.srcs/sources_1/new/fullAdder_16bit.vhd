----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2022 10:06:57 AM
-- Design Name: 
-- Module Name: fullAdder_16bit - Behavioral
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

entity fullAdder_16bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (15 downto 0);
           b : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC);
end fullAdder_16bit;

architecture Behavioral of fullAdder_16bit is
component fullAdder_4bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end component;
signal c0, c4, c8: STD_LOGIC;
begin
    pm1: fullAdder_4bit port map('0', a(3 downto 0), b(3 downto 0), sum(3 downto 0), c0);
    pm2: fullAdder_4bit port map(c0, a(7 downto 4), b(7 downto 4), sum(7 downto 4), c4);
    pm3: fullAdder_4bit port map(c4, a(11 downto 8), b(11 downto 8), sum(11 downto 8), c8);
    pm4: fullAdder_4bit port map(c8, a(15 downto 12), b(15 downto 12), sum(15 downto 12), cout);

end Behavioral;
