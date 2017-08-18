from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction


def generate_save(asm: AsmInstruction, instructions: List[MlInstruction]):
    address = int(asm.operands[0])

    instructions.append(MlInstruction(
        address=address * 4,
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=asm.comment
    ))

    instructions.append(MlInstruction(
        address=address * 4 + 3,
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=None
    ))

    instructions.append(MlInstruction(
        address=address * 4 + 2,
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=None
    ))

    instructions.append(MlInstruction(
        address=address * 4 + 1,
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=None
    ))
