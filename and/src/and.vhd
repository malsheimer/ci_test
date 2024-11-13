-------------------------------------------------------------------------------
-- Project  : N/A
-- File     : and.vhd
-- Created  : 13.11.2024
-- Standard : VHDL'93/02
-------------------------------------------------------------------------------
--*
--* @short
--*
--* <Main documentation>
--* <@li Example item>
--*
--* Needed Libraries and Packages:
--* @li std_logic_1164 standard multi-value logic package
--* <@li Other libs>
--*
--* <Additional Information in vhdldoc-style>
--*
--* @author malsheimer
--* @date   13.11.2024
--* @internal
--/
-------------------------------------------------------------------------------
-- Modification history :
-- Date        Author & Description
-- 13.11.2024  malsheimer: Created
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

-------------------------------------------------------------------------------

ENTITY and_x IS
  PORT (
    i_a : IN    STD_LOGIC;
    i_b : IN    STD_LOGIC;
    i_c : IN    STD_LOGIC;
    i_d : IN    STD_LOGIC;
    o_y : OUT   STD_LOGIC);
END ENTITY and_x;

ARCHITECTURE rtl OF and_x IS
BEGIN

  o_y <= i_a AND i_b AND i_c AND i_d;

END ARCHITECTURE rtl;
