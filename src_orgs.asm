
	; fix riskyhoney hive block difference on antidmg and antisword
	.org HiveBlockHappensHereFunction
	ldr r0, =Hook_DoHiveCheckFirst|1
	bx r0

	.org HiveBlockHappensHereFunction_Fix0DamageAntiMagic
	blt HiveBlockHappensHereFunction_AntiDmgNotTriggered

	.org HiveBlockHappensHereFunction_OldHiveCheck
HiveBlockHappensHereFunction_AntiDmgNotTriggered:
	cmp r6, 1
	beq HiveBlockHappensHereFunction_CancelDamage
	b HiveBlockHappensHereFunction_Return
	.pool

	; fix B PowerAttack glitch
	.org SpoutCrossBPwrAtkInitialize+0x14
	strb r0, [r7, 0x2]
	mov r0, 0xd
	str r0, [r7, 0xc]
	mov r0, 0
	strh r0, [r7, 0x6] ; atk boost
	mov r0, 0x25
	pop pc

	.org SlashCrossBPwrAtkInitialize
	push r4,lr ; modify push since we tail into another function to save space

	.org SlashCrossBPwrAtkInitialize+0x10
	mov r0, 0x80
	strb r0, [r7, 2]
	mov r0, 0
	str r0, [r7, 0xc]
	strh r0, [r7, 0x6] ; atk boost
	mov r0, 0x10
	b SlashCrossBPwrAtkInitialize-0x6

	.org TornadoDoubleDamage
	ldr r1, =Hook_FixTornadoDoubleDamage|1
	bx r1
	.pool
Hook_FixTornadoDoubleDamage_Return:
	lsl r0, r0, 1
	orr r0, r2

	.org BusterBugChargeShotDamageCalc_HookLoc
	ldr r1, =Hook_BusterBugChargeShotDamageCalc|1
	bx r1
	.pool
Hook_BusterBugChargeShotDamageCalc_Return:

	.org HandleElementManTimeout
	ldr r0, =Hook_FixElementManTimeout|1
	bx r0
	.pool

	.org HandleElementManTimeout+0x1a
Hook_FixElementManTimeout_Return:
