from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction


def generate_save_bits_off(asm: AsmInstruction,
                           instructions: List[MlInstruction]):
    address = int(asm.operands[0])

    instructions.append(MlInstruction(
        address=address * 4,
        ram_write=1,
        alu_opcode=0xE,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=asm.comment
    ))
