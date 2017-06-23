# Random-access Memory (RAM)

xkcd-skein-fpga uses the Spartan 6's block RAM. Since this is an IP design, an functionally identical RAM has been designed and verified. This is useful for verifying the higher-level chip design using Verilator.

## Design Requirements
- 16-bit Data Bus
- 9-bit Address Bus
  - 512 cells
- 8 kilobits
- Dual Port
- Ideally, one hash core uses the lower 4 kb and a second uses the upper 4 kb. However, this would happen outside of the scope of this module.
- An adapter that allows hot-swapping between Xilinx IP RAM and this design.

## Spartan 6 Notes
- RAM Write Mode should be set to NO_CHANGE mode.
- RAM Mode should be set to True Dual-Port, TDP.
- Output Registers Disabled (DO_REG = 0).
