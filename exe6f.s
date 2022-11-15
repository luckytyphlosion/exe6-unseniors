
INPUT_ROM          equ "exe6f.gba"
OUTPUT_ROM         equ "exe6f-unseniors.gba"

	.definelabel AirspinHP, 0x80dc4d4
	.definelabel HiveBlockHappensHereFunction, 0x0802DA50
	.definelabel HiveBlockHappensHereFunction_AntiDmgCheck, 0x802DA54
	.definelabel HiveBlockHappensHereFunction_CancelDamage, 0x802DB0E
	.definelabel HiveBlockHappensHereFunction_Fix0DamageAntiMagic, 0x802DAA4
	.definelabel HiveBlockHappensHereFunction_OldHiveCheck, 0x802DAD8
	.definelabel HiveBlockHappensHereFunction_Return, 0x802DB4C

	.definelabel SpoutCrossBPwrAtkInitialize, 0x801225e
	.definelabel SlashCrossBPwrAtkInitialize, 0x80122d2

	.definelabel PlaySoundEffect, 0x80005CC
	.definelabel fspace, 0x87ff4fc
