LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY jk_flipflop IS
    PORT (
        j     : IN  std_logic;
        clk   : IN  std_logic;
        k     : IN  std_logic;
        clr   : IN  std_logic;
        q     : OUT std_logic;
        q_not : OUT std_logic
    );
END jk_flipflop;

ARCHITECTURE gate_equiv OF jk_flipflop IS
    SIGNAL q_int  : std_logic := '0';
    SIGNAL qn_int : std_logic := '1';
BEGIN
    PROCESS(j, clk, k, clr, q_int, qn_int)
        VARIABLE nand_a : std_logic;
        VARIABLE nand_b : std_logic;
    BEGIN
        IF clr = '0' THEN
            q_int  <= '0';
            qn_int <= '1';
        ELSE
            nand_a := NOT (j AND clk AND qn_int);
            nand_b := NOT (k AND clk AND q_int);

            IF (nand_a = '0' AND nand_b = '1') THEN
                q_int  <= '1';
                qn_int <= '0';
            ELSIF (nand_a = '1' AND nand_b = '0') THEN
                q_int  <= '0';
                qn_int <= '1';
            ELSIF (nand_a = '0' AND nand_b = '0') THEN
                q_int  <= NOT q_int;
                qn_int <= NOT qn_int;
            END IF;
        END IF;
    END PROCESS;

    q     <= q_int;
    q_not <= qn_int;
END gate_equiv;