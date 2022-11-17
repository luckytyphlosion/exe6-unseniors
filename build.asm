
	.gba
	.include ver
	.include "macros.asm"

	.open INPUT_ROM, OUTPUT_ROM, 0x8000000

	; orgs
	.include "unseniors/src_orgs.asm"
	.include "bbn6/src_orgs.asm"

	.org fspace
	.include "unseniors/src_farspace.asm"
	.include "bbn6/src_farspace.asm"

	.close
; eof
