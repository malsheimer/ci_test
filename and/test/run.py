"""
VUnit Test Project
"""
from pathlib import Path
from vunit import VUnit

VU = VUnit.from_argv()
VU.add_vhdl_builtins()

SRC_PATH = Path(__file__).parent / ".."

VU.add_library("lib").add_source_files(
    [SRC_PATH / "src" / "*.vhd", SRC_PATH / "test" / "tb" / "*.vhd"]
)

VU.main()
