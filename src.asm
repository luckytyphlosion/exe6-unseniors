
	.gba
	.include ver
	; .include "macros.inc"
	; .include "constants.inc"

	.open INPUT_ROM, OUTPUT_ROM, 0x8000000

	.org HiveBlockHappensHereFunction
	ldr r0, =Hook_DoHiveCheckFirst+1
	bx r0

	.org HiveBlockHappensHereFunction_Fix0DamageAntiMagic
	blt HiveBlockHappensHereFunction_AntiDmgNotTriggered

	.org HiveBlockHappensHereFunction_OldHiveCheck
HiveBlockHappensHereFunction_AntiDmgNotTriggered:
	cmp r6, 1
	beq HiveBlockHappensHereFunction_CancelDamage
	b HiveBlockHappensHereFunction_Return
	.pool

	.org fspace
Hook_DoHiveCheckFirst:
	push r4,r6,r7,lr
	ldr r4, [r5, 0x54]

	ldr r1, =0x8010934|1
	mov lr, pc
	bx r1

	ldr r1, =0x200000
	tst r0, r1
	beq @@doAntiDmgCheck
	mov r1, 0x84
	ldrh r1, [r4, r1]
	cmp r1, 0
	bne @@doAntiDmgCheck
	mov r0, 0x82
	add r0, r0, r4
	ldrh r2, [r0]
	ldrh r1, [r0, 0x4]
	orr r2, r1
	ldrh r1, [r0, 0x6]
	orr r2, r1
	ldrh r1, [r0, 0x8]
	orr r2, r1
	cmp r2, 0x0
	beq @@cancelDamage
	ldr r3, [r5, 0x58]
	add r3, 0xA0
	mov r0, 0x1
	str r0, [r3, 0x30]

	mov r0, 0x6E
	ldr r1, =PlaySoundEffect|1
	mov lr, pc
	bx r1

	b @@cancelDamage
@@doAntiDmgCheck:
	ldr r0, =HiveBlockHappensHereFunction_AntiDmgCheck|1
	bx r0
@@cancelDamage:
	ldr r0, =HiveBlockHappensHereFunction_CancelDamage|1
	bx r0
	.pool

	.close
; eof
