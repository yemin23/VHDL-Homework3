LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY rs_latch IS
    PORT (
        s     : IN std_logic;
        r     : IN std_logic;
        q     : OUT std_logic;
        q_not : OUT std_logic
    );
END rs_latch;

ARCHITECTURE dataflow OF rs_latch IS
    SIGNAL q_internal     : std_logic;
    SIGNAL q_not_internal : std_logic;
BEGIN
    q_internal     <= r NOR q_not_internal;
    q_not_internal <= s NOR q_internal;
    
    q       <= q_internal;
    q_not   <= q_not_internal;
END dataflow;