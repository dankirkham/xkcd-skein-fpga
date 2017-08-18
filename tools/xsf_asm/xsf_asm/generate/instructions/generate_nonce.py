from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction


def generate_nonce(asm: AsmInstruction, instructions: List[MlInstruction]):
    address = int(asm.operands[0])

    instructions.append(MlInstruction(
        address=address,
        ram_write=0,
        alu_opcode=0x0,
        input_select=0,
        output_select=None,
        output_enable=0,
        save_core_selection=0,
        comment=asm.comment
    ))
