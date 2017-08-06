from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction
from xsf_asm.generate.instructions import *

class Generator:
    def __init__(self):
        pass

    def _generate_instruction(self, asm: AsmInstruction, instructions: List[MlInstruction]):
        if asm.operator is None: # This means that the instruction is only a comment
            instructions.append(MlInstruction(None, None, None, None, None, None, None, asm.comment))
        elif asm.operator == "Add":
            return generate_add(asm, instructions)
        elif asm.operator == "Constant":
            return generate_constant(asm, instructions)
        elif asm.operator == "CoreId":
            return generate_core_id(asm, instructions)
        elif asm.operator == "Count":
            return generate_count(asm, instructions)
        elif asm.operator == "Load":
            return generate_load(asm, instructions)
        elif asm.operator == "Nonce":
            return generate_nonce(asm, instructions)
        elif asm.operator == "Read":
            return generate_read(asm, instructions)
        elif asm.operator == "RotateLeft":
            return generate_rotate_left(asm, instructions)
        elif asm.operator == "Save":
            return generate_save(asm, instructions)
        elif asm.operator == "SaveBitCounter":
            return generate_save_bit_counter(asm, instructions)
        elif asm.operator == "SaveBitsOff":
            return generate_save_bits_off(asm, instructions)
        elif asm.operator == "SaveComparator":
            return generate_save_comparator(asm, instructions)
        elif asm.operator == "SaveNonce":
            return generate_save_nonce(asm, instructions)
        elif asm.operator == "SelectCore":
            return generate_select_core(asm, instructions)
        elif asm.operator == "XOR":
            return generate_xor(asm, instructions)
        else:
            raise NotImplementedError("No generation code for {} exists.".format(asm.operator))

    def generate(self, asm_instructions: List[AsmInstruction]):
        """Generates machine code for a list of assembly language instructions.

        Attributes:
            asm_instructions -- A list of AsmInstructions
        """

        ml_instructions = []

        for asm in asm_instructions:
            self._generate_instruction(asm, ml_instructions)

        return ml_instructions
