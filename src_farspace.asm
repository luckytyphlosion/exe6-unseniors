
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

Hook_FixTornadoDoubleDamage:
	ldrb r1, [r5, 0x13]
	mov r2, 2
	ldr r3, =object_setPanelType|1
	mov lr, pc
	bx r3
	ldrh r0, [r5, oBattleObject_Damage]
	ldr r1, =0xf800 
	mov r2, r1
	and r2, r0
	bic r0, r1
	ldr r1, =Hook_FixTornadoDoubleDamage_Return|1
	bx r1
	.pool
