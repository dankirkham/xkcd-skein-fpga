from typing import List
from xsf_asm.asm_instruction import AsmInstruction
from xsf_asm.ml_instruction import MlInstruction
from xsf_asm.generate.instructions import generate_add, generate_constant, \
    generate_core_id, generate_count, generate_increment_nonce, generate_load, \
    generate_nonce, generate_read, generate_rotate_left, \
    generate_save_bit_counter, generate_save_bits_off, \
    generate_save_comparator, generate_save_nonce, generate_save, \
    generate_select_core_nonce, generate_select_core, generate_transmit, \
    generate_xor


class Generator:
    def __init__(self):
        pass

    def _generate_instruction(self, asm: AsmInstruction,
                              instructions: List[MlInstruction]):
        if asm.operator is None:    # This means that the instruction
                                    # is only a comment
            instructions.append(MlInstruction(None, None, None, None, None,
                                              None, None, asm.comment, None))
        elif asm.operator == "Add":
            return generate_add.generate_add(asm, instructions)
        elif asm.operator == "Constant":
            return generate_constant.generate_constant(asm, instructions)
        elif asm.operator == "CoreId":
            return generate_core_id.generate_core_id(asm, instructions)
        elif asm.operator == "Count":
            return generate_count.generate_count(asm, instructions)
        elif asm.operator == "IncrementNonce":
            return generate_increment_nonce.generate_increment_nonce(
                asm,
                instructions
            )
        elif asm.operator == "Load":
            return generate_load.generate_load(asm, instructions)
        elif asm.operator == "Nonce":
            return generate_nonce.generate_nonce(asm, instructions)
        elif asm.operator == "Read":
            return generate_read.generate_read(asm, instructions)
        elif asm.operator == "RotateLeft":
            return generate_rotate_left.generate_rotate_left(asm, instructions)
        elif asm.operator == "Save":
            return generate_save.generate_save(asm, instructions)
        elif asm.operator == "SaveBitCounter":
            return generate_save_bit_counter.generate_save_bit_counter(
                asm,
                instructions
            )
        elif asm.operator == "SaveBitsOff":
            return generate_save_bits_off.generate_save_bits_off(asm,
                                                                 instructions)
        elif asm.operator == "SaveComparator":
            return generate_save_comparator.generate_save_comparator(
                asm,
                instructions
            )
        elif asm.operator == "SaveNonce":
            return generate_save_nonce.generate_save_nonce(asm, instructions)
        elif asm.operator == "SelectCore":
            return generate_select_core.generate_select_core(asm, instructions)
        elif asm.operator == "SelectCoreNonce":
            return generate_select_core_nonce.generate_select_core_nonce(
                asm,
                instructions
            )
        elif asm.operator == "Transmit":
            return generate_transmit.generate_transmit(asm, instructions)
        elif asm.operator == "XOR":
            return generate_xor.generate_xor(asm, instructions)
        else:
            raise NotImplementedError(
                "No generation code for {} exists.".format(asm.operator)
            )

    def generate(self, asm_instructions: List[AsmInstruction]):
        """Generates machine code for a list of assembly language instructions.

        Attributes:
            asm_instructions -- A list of AsmInstructions
        """

        ml_instructions = []

        for asm in asm_instructions:
            self._generate_instruction(asm, ml_instructions)

        return ml_instructions
