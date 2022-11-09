mkdir "temp" 2> nul

tools\armips src.asm -sym exe6f-unseniors.sym -strequ ver "exe6f.s"
if errorlevel 1 pause
tools\armips src.asm -sym exe6g-unseniors.sym -strequ ver "exe6g.s"
if errorlevel 1 pause
