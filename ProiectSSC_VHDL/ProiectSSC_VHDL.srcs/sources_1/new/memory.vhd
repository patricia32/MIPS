----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2022 04:23:18 PM
-- Design Name: 
-- Module Name: MEM_comp - Behavioral
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

entity memory is
  Port (   rd1_code: in STD_LOGIC_VECTOR (2 downto 0);
           rd2_code :in STD_LOGIC_VECTOR (2 downto 0);
           MemWrite : in STD_LOGIC;
           ALUResIn : in STD_LOGIC_VECTOR (15 downto 0);
           RD2 : in STD_LOGIC_VECTOR (15 downto 0);
           MemData : out STD_LOGIC_VECTOR (15 downto 0);
           MemDataRD1 : out STD_LOGIC_VECTOR (15 downto 0);
           MemDataRD2 : out STD_LOGIC_VECTOR (15 downto 0);
           ALUResOut : out STD_LOGIC_VECTOR (15 downto 0);
           enable : in STD_LOGIC;
           clk : in STD_LOGIC);
end memory;

architecture Behavioral of memory is
   
     type MEM is array(0 to 15) of std_logic_vector(15 downto 0);
     signal RAM: MEM := (
            x"0000",  -- 000
            x"0045",  -- 001
            X"0033",  -- 010
            X"0000",  -- 011
            X"0003",  -- 100
            X"0003",  -- 101
             OTHERS => X"0000");
  
begin
    -- write first
     process(clk, enable, MemWrite)
      begin
           MemData <= RAM(conv_integer(ALUResIn)); 
           MemDataRD1 <= RAM(conv_integer(rd1_code)); 
           MemDataRD2 <= RAM(conv_integer(rd2_code)); 
 
     end process;
   AluResOut <= AluResIn;
end Behavioral;
