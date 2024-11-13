
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY vunit_lib;
CONTEXT vunit_lib.vunit_context;

-------------------------------------------------------------------------------

ENTITY and_x_tb IS
  GENERIC (
    runner_cfg : string);
END and_x_tb;

-------------------------------------------------------------------------------

ARCHITECTURE tb OF and_x_tb IS

  CONSTANT tb_logger  : logger_t  := get_logger("tb");
  CONSTANT tb_checker : checker_t := new_checker(tb_logger);

  SIGNAL i_a : STD_LOGIC;
  SIGNAL i_b : STD_LOGIC;
  SIGNAL i_c : STD_LOGIC;
  SIGNAL o_y : STD_LOGIC;

BEGIN

  and_x_1 : ENTITY work.and_x
    PORT MAP (
      i_a => i_a,
      i_b => i_b,
      i_c => i_c,
      o_y => o_y);

  main : PROCESS
  BEGIN
    test_runner_setup(runner, runner_cfg);
    WHILE test_suite LOOP

      IF run("test_00") THEN
        info("Test: a = 0, b = 0");
        i_a <= '0';
        i_b <= '0';
        i_c <= '0';
        WAIT FOR 1 ns;
        check(tb_checker, o_y = '0', "Check Y == 0");
      END IF;

      IF run("test_01") THEN
        info("Test: a = 1, b = 0");
        i_a <= '1';
        i_b <= '0';
        i_c <= '0';
        WAIT FOR 1 ns;
        check(tb_checker, o_y = '0', "Check Y == 0");
      END IF;

      IF run("test_10") THEN
        info("Test: a = 0, b = 1");
        i_a <= '0';
        i_b <= '1';
        i_c <= '0';
        WAIT FOR 1 ns;
        check(tb_checker, o_y = '0', "Check Y == 0");
      END IF;

      IF run("test_11") THEN
        info("Test: a = 1, b = 1");
        i_a <= '1';
        i_b <= '1';
        i_c <= '1';
        WAIT FOR 1 ns;
        check(tb_checker, o_y = '1', "Check Y == 1");
      END IF;

    END LOOP;
    test_runner_cleanup(runner);
    wait;
  END PROCESS main;

END tb;
