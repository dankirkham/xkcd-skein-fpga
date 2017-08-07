from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction

def generate_rotate_left(asm: AsmInstruction, instructions: List[MlInstruction]):
    bits = int(asm.operands[0])
    address = int(asm.operands[1])

    for i in range(bits % 16):
        instructions.append(MlInstruction(
            address=None,
            ram_write=0,
            alu_opcode=0x3,
            input_select=None,
            output_select=None,
            output_enable=0,
            save_core_selection=0,
            comment=asm.comment if i == 0 else None
        ))

    instructions.append(MlInstruction(
        address=address * 4 + int(bits / 16),
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=asm.comment if bits % 16 == 0 else None
    ))

    instructions.append(MlInstruction(
        address=address * 4 + (3 + int(bits / 16) % 4),
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=None
    ))

    instructions.append(MlInstruction(
        address=address * 4 + (2 + int(bits / 16) % 4),
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=None
    ))

    instructions.append(MlInstruction(
        address=address * 4 + (1 + int(bits / 16) % 4),
        ram_write=1,
        alu_opcode=0x2,
        input_select=None,
        output_select=0,
        output_enable=0,
        save_core_selection=0,
        comment=None
    ))
