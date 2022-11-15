
	.gba
	.include ver
	; .include "macros.inc"
	; .include "constants.inc"

	.open INPUT_ROM, OUTPUT_ROM, 0x8000000

	.include "src_orgs.asm"
	.include "src_farspace.asm"

	.close
; eof
