----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/17/2022 10:00:18 AM
-- Design Name: 
-- Module Name: fullAdder_4bit - Behavioral
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

entity fullAdder_4bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC);
end fullAdder_4bit;

architecture Behavioral of fullAdder_4bit is
component fullAdder_1bit is
    Port ( cin : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end component;
signal c0, c1, c2: STD_LOGIC;
begin
    pm1: fullAdder_1bit port map(cin, a(0), b(0), sum(0), c0);
    pm2: fullAdder_1bit port map(c0, a(1), b(1), sum(1), c1);
    pm3: fullAdder_1bit port map(c1, a(2), b(2), sum(2), c2);
    pm4: fullAdder_1bit port map(c2, a(3), b(3), sum(3), cout);

end Behavioral;
