LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY d_latch IS
    PORT (
        en    : IN std_logic;
        d     : IN std_logic;
        q     : OUT std_logic;
        q_not : OUT std_logic
    );
END d_latch;

ARCHITECTURE behavior OF d_latch IS
BEGIN
    process(en, d)
    begin
        -- Enable이 1일 때만 D 값을 출력으로 전달 (Follow)
        if (en = '1') then
            q <= d;
            q_not <= not d;
        end if;
        -- Enable이 0일 때는 아무 동작도 하지 않음 (자동으로 이전 값 Hold)
    end process;
END behavior;