./tools/armips.exe build.asm -sym exe6f-unseniors-temp.sym -strequ ver "exe6f.s" -equ TL_PATCH 0
./tools/armips.exe build.asm -sym exe6g-unseniors-temp.sym -strequ ver "exe6g.s" -equ TL_PATCH 0

./tools/armips.exe build.asm -sym exe6f_us-unseniors-temp.sym -strequ ver "exe6f.s" -equ TL_PATCH 1
./tools/armips.exe build.asm -sym exe6g_us-unseniors-temp.sym -strequ ver "exe6g.s" -equ TL_PATCH 1


if [[ $? -ne 0 ]] ; then
    exit 1
fi

head -c -1 exe6f-unseniors-temp.sym | cat - constants_ewram.sym > exe6f-unseniors.sym
head -c -1 exe6g-unseniors-temp.sym | cat - constants_ewram.sym > exe6g-unseniors.sym
head -c -1 exe6f_us-unseniors-temp.sym | cat - constants_ewram.sym > exe6f_us-unseniors.sym
head -c -1 exe6g_us-unseniors-temp.sym | cat - constants_ewram.sym > exe6g_us-unseniors.sym

rm exe6f-unseniors-temp.sym exe6g-unseniors-temp.sym exe6f_us-unseniors-temp.sym exe6g_us-unseniors-temp.sym
