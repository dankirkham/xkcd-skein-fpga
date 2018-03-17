from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction


def generate_xor(asm: AsmInstruction, instructions: List[MlInstruction]):
    instructions.append(MlInstruction(
        address=None,
        ram_write=0,
        alu_opcode=0x7,
        input_select=None,
        output_select=None,
        output_enable=0,
        save_core_selection=0,
        comment=asm.comment,
        global_command=0
    ))
