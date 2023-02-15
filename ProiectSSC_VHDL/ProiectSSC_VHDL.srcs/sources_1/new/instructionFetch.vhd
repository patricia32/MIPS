----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2022 06:39:15 PM
-- Design Name: 
-- Module Name: instructionFetch - Behavioral
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

entity instructionFetch is
  Port ( jumpAddress: in STD_LOGIC_VECTOR(15 downto 0);
         branchAddress: in STD_LOGIC_VECTOR(15 downto 0);
         jump: in STD_LOGIC;
         PCsrc: in STD_LOGIC;
         clk: in STD_LOGIC;
         reset: in STD_LOGIC;
         enable: in STD_LOGIC;
         PC: out STD_LOGIC_VECTOR(15 downto 0);
         instruction: out STD_LOGIC_VECTOR(15 downto 0));
end instructionFetch;

architecture Behavioral of instructionFetch is
     signal pc_counter, NextAddress, PCAux, PCinc,  AuxSgn: STD_LOGIC_VECTOR(15 downto 0) := x"0000";
     type MEM is array(0 to 255) of STD_LOGIC_VECTOR(15 downto 0);
     signal ROM: MEM := (
               
         B"000_001_010_011_0_000", -- add
         B"000_001_010_011_0_001", -- sub
         B"000_001_010_011_0_010", -- arithm shift 
        
         B"000_001_010_011_0_011", -- logical left shift 
         B"000_001_010_011_0_100", -- logical right shift 
         B"000_001_010_011_0_101", -- logical left rotate 
         B"000_001_010_011_0_110", --  logical right rotate 
        
         B"000_001_010_011_0_111", --  and 
         B"001_001_010_011_0_000", -- nand
         B"001_001_010_011_0_001", -- or 
         B"001_001_010_011_0_010", -- nor
         B"001_001_010_011_0_011", -- xor
         B"001_001_010_011_0_100", -- nxor 
         B"001_001_010_011_0_101", -- not
       
         B"011_100_010_010_0_000", -- ble
         B"000_000_000_000_0_000", -- noop
         B"000_000_000_000_0_000", -- noop
         B"000_000_000_000_0_000", -- noop
         B"001_001_010_011_0_110", -- equality test fail
         B"001_100_101_011_0_110", -- equality test pass
         B"001_010_001_011_0_111", -- greater test fail
         B"001_001_010_011_0_111", -- greater test pass
         B"010_001_010_011_0_000", -- lt test fail
         B"010_010_001_011_0_000", -- lt test pass
         B"010_001_010_011_0_001", -- positivity test    0 poz, 1 neg
            
         B"111_0000000000000", -- jump
         
        OTHERS => X"0000");
begin
    -- PROGRAM COUNTER
    process(clk)
    begin
      if reset = '1' then
        pc_counter <= x"0000";
      end if;
        if rising_edge(clk) then 
             if enable = '1' then
                pc_counter <= NextAddress;
              end if ;
        end if;
    end process;
    
    Instruction <= ROM(conv_integer(pc_counter));
    
    PCAux <= pc_counter + 1;
    PCinc <= PCAux;
    
    -- mux branch
    process(PCsrc, PCAux, BranchAddress)
    begin
        if PCsrc = '0' then
            AuxSgn <= PCAux;
        else
            AuxSgn <= BranchAddress;
        end if;
    end process;
    
    
    -- mux jump
        process(Jump, AuxSgn, JumpAddress)
        begin
            if jump = '0' then 
                NextAddress <= AuxSgn;
            else
                NextAddress <= JumpAddress;
            end if;
        end process;
    PC <= pc_counter;
end Behavioral;
