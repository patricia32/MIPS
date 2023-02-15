----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2022 06:36:29 PM
-- Design Name: 
-- Module Name: ID_comp - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructionDecode is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           instruction : in STD_LOGIC_VECTOR (12 downto 0);
           wd : in STD_LOGIC_VECTOR (15 downto 0);
           regWrite : in STD_LOGIC;
           func : out STD_LOGIC_VECTOR (2 downto 0));
end instructionDecode;

architecture Behavioral of instructionDecode is
signal input: STD_LOGIC_VECTOR(2 downto 0);

type IDtype is array(0 to 7) of STD_LOGIC_VECTOR(15 downto 0);
    signal ID: IDtype := (
         x"0001",  -- 00
         x"0050",  -- 01
         X"0029",  -- 10
         X"0002",  -- 11
         X"0002",
       others => x"1234");
       
signal acumulator: STD_LOGIC_VECTOR(15 downto 0);
begin
    
    process(clk, enable, regWrite)
    begin
       if rising_edge(clk) then
           if  regWrite = '1' and enable = '1' then
               ID(conv_integer(instruction(6 downto 4))) <= wd;
           end if;
       end if;
  end process;
  acumulator <= wd;
  
  func <= instruction(2 downto 0);
  
end Behavioral;
