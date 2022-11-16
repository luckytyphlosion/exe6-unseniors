./tools/armips.exe src.asm -sym exe6f-unseniors-temp.sym -strequ ver "exe6f.s"
./tools/armips.exe src.asm -sym exe6g-unseniors-temp.sym -strequ ver "exe6g.s"

if [[ $? -ne 0 ]] ; then
    exit 1
fi

head -c -1 exe6f-unseniors-temp.sym | cat - constants_ewram.sym > exe6f-unseniors.sym
head -c -1 exe6g-unseniors-temp.sym | cat - constants_ewram.sym > exe6g-unseniors.sym
