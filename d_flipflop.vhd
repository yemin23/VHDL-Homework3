LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_flipflop IS
    PORT (
        clk   : IN  std_logic;
        d     : IN  std_logic;
        q     : OUT std_logic;
        q_not : OUT std_logic
    );
END d_flipflop;

ARCHITECTURE behavior OF d_flipflop IS
BEGIN
    process(clk)
    begin
        if rising_edge(clk) then
            q     <= d;
            q_not <= not d;
        end if;
    end process;
END behavior;