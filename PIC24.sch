VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Clk
        SIGNAL RegDest
        SIGNAL Instr(10:7)
        SIGNAL WrReg(3:0)
        SIGNAL Instr(3:0)
        SIGNAL RdData1(15:0)
        SIGNAL ALUOP(2:0)
        SIGNAL CE_NF
        SIGNAL CE_ZF
        SIGNAL CE_OVF
        SIGNAL CE_CF
        SIGNAL MemOut(15:0)
        SIGNAL MemWr
        SIGNAL IWN0(15:0)
        SIGNAL INW1(15:0)
        SIGNAL Instr(8:4)
        SIGNAL OUTW0(15:0)
        SIGNAL Base(3:0)
        SIGNAL WrData(15:0)
        SIGNAL Mem2Reg
        SIGNAL RegBase
        SIGNAL ZF
        SIGNAL Instr(23:16)
        SIGNAL New_PC(5:0)
        SIGNAL PC(5:0)
        SIGNAL PC(5:1)
        SIGNAL Instr(23:0)
        SIGNAL Instr(4:0)
        SIGNAL RdData2(15:0)
        SIGNAL Y(15:0)
        SIGNAL N
        SIGNAL OV
        SIGNAL Branch(2:0)
        SIGNAL Instr(14:11)
        SIGNAL RegWr
        SIGNAL C
        SIGNAL Instr(18:15)
        SIGNAL Instr(13:4)
        PORT Input Clk
        PORT Input IWN0(15:0)
        PORT Input INW1(15:0)
        PORT Output OUTW0(15:0)
        PORT Output ZF
        PORT Output N
        PORT Output OV
        PORT Output C
        BEGIN BLOCKDEF PC_Update
            TIMESTAMP 2025 1 4 21 28 10
            LINE N 64 32 0 32 
            LINE N 64 96 0 96 
            LINE N 64 160 0 160 
            LINE N 64 224 0 224 
            RECTANGLE N 0 276 64 300 
            LINE N 64 288 0 288 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 0 -32 64 -32 
            LINE N 384 -32 320 -32 
            RECTANGLE N 320 -44 384 -20 
            RECTANGLE N 64 -192 320 320 
        END BLOCKDEF
        BEGIN BLOCKDEF ProgCnt
            TIMESTAMP 2024 12 17 8 18 26
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -108 384 -84 
            LINE N 320 -96 384 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V4
            TIMESTAMP 2025 1 5 0 52 16
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -28 64 -4 
            LINE N 64 -16 0 -16 
        END BLOCKDEF
        BEGIN BLOCKDEF File_Regs
            TIMESTAMP 2025 1 4 23 35 12
            RECTANGLE N 64 -384 384 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 384 -364 448 -340 
            LINE N 384 -352 448 -352 
            RECTANGLE N 384 -44 448 -20 
            LINE N 384 -32 448 -32 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF ALU
            TIMESTAMP 2025 1 10 17 49 53
            RECTANGLE N 0 404 64 428 
            LINE N 64 416 0 416 
            RECTANGLE N 0 468 64 492 
            LINE N 64 480 0 480 
            LINE N 64 160 0 160 
            LINE N 64 224 0 224 
            LINE N 64 288 0 288 
            LINE N 64 352 0 352 
            LINE N 320 160 384 160 
            LINE N 320 224 384 224 
            LINE N 320 288 384 288 
            LINE N 320 352 384 352 
            LINE N 64 -480 0 -480 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
            RECTANGLE N 64 -512 320 576 
        END BLOCKDEF
        BEGIN BLOCKDEF ROM32X24
            TIMESTAMP 2025 1 9 23 42 27
            RECTANGLE N 64 -64 320 0 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 320 -44 384 -20 
            LINE N 320 -32 384 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF DataMem
            TIMESTAMP 2024 12 17 8 25 30
            RECTANGLE N 64 -384 368 0 
            LINE N 64 -352 0 -352 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
            RECTANGLE N 368 -364 432 -340 
            LINE N 368 -352 432 -352 
            RECTANGLE N 368 -44 432 -20 
            LINE N 368 -32 432 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF MUX2V16
            TIMESTAMP 2025 1 4 22 9 38
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 320 -160 384 -160 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -32 0 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF ctrl
            TIMESTAMP 2025 1 10 17 47 33
            LINE N 320 608 384 608 
            LINE N 320 672 384 672 
            LINE N 320 736 384 736 
            LINE N 320 800 384 800 
            RECTANGLE N 320 532 384 556 
            LINE N 320 544 384 544 
            RECTANGLE N 0 276 64 300 
            LINE N 64 288 0 288 
            LINE N 320 288 384 288 
            LINE N 320 352 384 352 
            LINE N 320 416 384 416 
            LINE N 320 480 384 480 
            RECTANGLE N 64 88 320 832 
            LINE N 320 160 384 160 
            RECTANGLE N 320 212 384 236 
            LINE N 320 224 384 224 
        END BLOCKDEF
        BEGIN BLOCK U_ALU ALU
            PIN CE_N CE_NF
            PIN CE_Z CE_ZF
            PIN CE_OV CE_OVF
            PIN CE_C CE_CF
            PIN Clk Clk
            PIN RdData1(15:0) RdData1(15:0)
            PIN RdData2(15:0) RdData2(15:0)
            PIN ALUOP(2:0) ALUOP(2:0)
            PIN Lit5(4:0) Instr(4:0)
            PIN Lit10(9:0) Instr(13:4)
            PIN ZF ZF
            PIN C C
            PIN OV OV
            PIN N N
            PIN Y(15:0) Y(15:0)
        END BLOCK
        BEGIN BLOCK U_ROM ROM32X24
            PIN Addr(4:0) PC(5:1)
            PIN Data(23:0) Instr(23:0)
        END BLOCK
        BEGIN BLOCK U_DataMem DataMem
            PIN Clk Clk
            PIN Wr MemWr
            PIN INW0(15:0) IWN0(15:0)
            PIN INW1(15:0) INW1(15:0)
            PIN Addr(4:0) Instr(8:4)
            PIN DataIn(15:0) RdData2(15:0)
            PIN OUTW0(15:0) OUTW0(15:0)
            PIN DataOut(15:0) MemOut(15:0)
        END BLOCK
        BEGIN BLOCK U_MUX2V16 MUX2V16
            PIN Sel Mem2Reg
            PIN Y(15:0) WrData(15:0)
            PIN I1(15:0) MemOut(15:0)
            PIN I0(15:0) Y(15:0)
        END BLOCK
        BEGIN BLOCK U_File_Regs File_Regs
            PIN Clk Clk
            PIN WrEn RegWr
            PIN RdReg1(3:0) Base(3:0)
            PIN RdReg2(3:0) Instr(3:0)
            PIN WrReg(3:0) WrReg(3:0)
            PIN WrData(15:0) WrData(15:0)
            PIN RdData1(15:0) RdData1(15:0)
            PIN RdData2(15:0) RdData2(15:0)
        END BLOCK
        BEGIN BLOCK U_MUX_Dest MUX2V4
            PIN Sel RegDest
            PIN I0(3:0) Instr(3:0)
            PIN I1(3:0) Instr(10:7)
            PIN Y(3:0) WrReg(3:0)
        END BLOCK
        BEGIN BLOCK U_MUX_Baza MUX2V4
            PIN Sel RegBase
            PIN I0(3:0) Instr(18:15)
            PIN I1(3:0) Instr(14:11)
            PIN Y(3:0) Base(3:0)
        END BLOCK
        BEGIN BLOCK U_CTRL ctrl
            PIN OPCODE(7:0) Instr(23:16)
            PIN BaseReg RegBase
            PIN RegDest RegDest
            PIN Mem2Reg Mem2Reg
            PIN MemWr MemWr
            PIN RegWr RegWr
            PIN CE_NF CE_NF
            PIN CE_CF CE_CF
            PIN CE_ZF CE_ZF
            PIN CE_OVF CE_OVF
            PIN Branch(2:0) Branch(2:0)
            PIN ALUOP(2:0) ALUOP(2:0)
        END BLOCK
        BEGIN BLOCK U_ProgCnt ProgCnt
            PIN Clk Clk
            PIN New_PC(5:0) New_PC(5:0)
            PIN PC(5:0) PC(5:0)
        END BLOCK
        BEGIN BLOCK U_PC_Update PC_Update
            PIN Offset(4:0) Instr(4:0)
            PIN PC(5:0) PC(5:0)
            PIN New_PC(5:0) New_PC(5:0)
            PIN ZF ZF
            PIN OVF OV
            PIN CF C
            PIN NF N
            PIN Branch(2:0) Branch(2:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 7040 5440
        BEGIN BRANCH Instr(10:7)
            WIRE 1936 1184 2048 1184
            WIRE 2048 1184 2160 1184
            BEGIN DISPLAY 2048 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 2112 1472 2128 1472
            WIRE 2128 1472 2160 1472
            BEGIN DISPLAY 2128 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1840 1536 1936 1536
        BEGIN BRANCH Instr(14:11)
            WIRE 1936 1536 2000 1536
            WIRE 2000 1536 2048 1536
            WIRE 2048 1536 2160 1536
            BEGIN DISPLAY 2000 1536 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 2736 1136 2784 1136
            WIRE 2784 1136 2832 1136
            BEGIN DISPLAY 2784 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2736 1200 2768 1200
            WIRE 2768 1200 2832 1200
            BEGIN DISPLAY 2768 1200 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrReg(3:0)
            WIRE 2544 1120 2624 1120
            WIRE 2624 1120 2624 1264
            WIRE 2624 1264 2720 1264
            WIRE 2720 1264 2832 1264
            BEGIN DISPLAY 2720 1264 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1840 1264 1936 1264
        BEGIN BRANCH Instr(3:0)
            WIRE 1936 1264 1968 1264
            WIRE 1968 1264 2016 1264
            WIRE 2016 1264 2016 1392
            WIRE 2016 1392 2832 1392
            WIRE 2016 1264 2160 1264
            BEGIN DISPLAY 1968 1264 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemOut(15:0)
            WIRE 4432 1632 4432 1888
            WIRE 4432 1888 4560 1888
            WIRE 4432 1632 4528 1632
            WIRE 4528 1632 4784 1632
            WIRE 4768 1296 4784 1296
            WIRE 4784 1296 4784 1632
            BEGIN DISPLAY 4528 1632 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUX2V16 4560 1984 R0
            BEGIN DISPLAY -32 -280 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Mem2Reg
            WIRE 4496 1824 4512 1824
            WIRE 4512 1824 4560 1824
            BEGIN DISPLAY 4512 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 4224 976 4336 976
            BEGIN DISPLAY 4224 976 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 4208 1040 4336 1040
            BEGIN DISPLAY 4208 1040 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IWN0(15:0)
            WIRE 4256 1104 4336 1104
        END BRANCH
        BEGIN BRANCH INW1(15:0)
            WIRE 4256 1168 4336 1168
        END BRANCH
        BEGIN BRANCH Instr(8:4)
            WIRE 4176 1232 4240 1232
            WIRE 4240 1232 4336 1232
            BEGIN DISPLAY 4240 1232 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_DataMem 4336 1328 R0
            BEGIN DISPLAY 0 -504 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        IOMARKER 4256 1104 IWN0(15:0) R180 28
        IOMARKER 4256 1168 INW1(15:0) R180 28
        BEGIN BRANCH OUTW0(15:0)
            WIRE 4768 976 4832 976
        END BRANCH
        IOMARKER 4832 976 OUTW0(15:0) R0 28
        BEGIN INSTANCE U_File_Regs 2832 1488 R0
            BEGIN DISPLAY 0 -504 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Base(3:0)
            WIRE 2544 1472 2592 1472
            WIRE 2592 1472 2688 1472
            WIRE 2688 1328 2688 1472
            WIRE 2688 1328 2832 1328
            BEGIN DISPLAY 2592 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH WrData(15:0)
            WIRE 2752 1456 2752 2224
            WIRE 2752 2224 3088 2224
            WIRE 3088 2224 5008 2224
            WIRE 2752 1456 2832 1456
            WIRE 4944 1824 5008 1824
            WIRE 5008 1824 5008 2224
            BEGIN DISPLAY 3088 2224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUX_Baza 2160 1632 R0
            BEGIN DISPLAY 0 -280 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH CE_CF
            WIRE 2432 2592 2464 2592
            WIRE 2464 2592 2624 2592
            BEGIN DISPLAY 2464 2592 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 2432 2528 2480 2528
            WIRE 2480 2528 2624 2528
            BEGIN DISPLAY 2480 2528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1840 2528 1936 2528
        BEGIN BRANCH Clk
            WIRE 480 1408 560 1408
        END BRANCH
        BEGIN BRANCH New_PC(5:0)
            WIRE 304 816 560 816
            WIRE 304 816 304 1008
            WIRE 304 1008 304 1472
            WIRE 304 1472 560 1472
            BEGIN DISPLAY 304 1008 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_PC_Update 560 848 R0
            BEGIN DISPLAY 0 -312 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH PC(5:0)
            WIRE 944 816 960 816
            WIRE 960 816 992 816
            WIRE 992 816 992 1040
            WIRE 992 1040 992 1408
            WIRE 944 1408 992 1408
            BEGIN DISPLAY 960 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 992 1040 1088 1040
        BEGIN BRANCH PC(5:1)
            WIRE 1088 1040 1216 1040
            WIRE 1216 1040 1360 1040
            BEGIN DISPLAY 1216 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ROM 1360 1072 R0
            BEGIN DISPLAY 0 -184 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH Instr(23:0)
            WIRE 1744 1040 1840 1040
            WIRE 1840 1040 1840 1072
            WIRE 1840 1072 1840 1184
            WIRE 1840 1184 1840 1264
            WIRE 1840 1264 1840 1536
            WIRE 1840 1536 1840 1616
            WIRE 1840 1616 1840 2528
            WIRE 1840 2528 1840 2768
            BEGIN DISPLAY 1840 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(4:0)
            WIRE 416 496 2016 496
            WIRE 2016 496 2016 1072
            WIRE 416 496 416 624
            WIRE 416 624 416 752
            WIRE 416 752 560 752
            WIRE 1936 1072 2016 1072
            BEGIN DISPLAY 416 624 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1840 1072 1936 1072
        BEGIN BRANCH RdData2(15:0)
            WIRE 3280 1456 3328 1456
            WIRE 3328 1456 3424 1456
            WIRE 3328 1456 3328 2144
            WIRE 3328 2144 3440 2144
            WIRE 3440 2144 4272 2144
            WIRE 3424 1440 3424 1456
            WIRE 3424 1440 3568 1440
            WIRE 4272 1296 4336 1296
            WIRE 4272 1296 4272 2144
            BEGIN DISPLAY 3440 2144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_NF
            WIRE 3488 1696 3520 1696
            WIRE 3520 1696 3568 1696
            BEGIN DISPLAY 3520 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 3488 1760 3520 1760
            WIRE 3520 1760 3568 1760
            BEGIN DISPLAY 3520 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 3488 1824 3520 1824
            WIRE 3520 1824 3568 1824
            BEGIN DISPLAY 3520 1824 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_CF
            WIRE 3488 1888 3520 1888
            WIRE 3520 1888 3568 1888
            BEGIN DISPLAY 3520 1888 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Y(15:0)
            WIRE 3952 1504 4096 1504
            WIRE 4096 1504 4192 1504
            WIRE 4192 1504 4192 1952
            WIRE 4192 1952 4560 1952
            BEGIN DISPLAY 4096 1504 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ALUOP(2:0)
            WIRE 3488 1504 3520 1504
            WIRE 3520 1504 3568 1504
            BEGIN DISPLAY 3520 1504 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RdData1(15:0)
            WIRE 3280 1136 3328 1136
            WIRE 3328 1136 3328 1376
            WIRE 3328 1376 3568 1376
            BEGIN DISPLAY 3328 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Clk
            WIRE 3488 1056 3520 1056
            WIRE 3520 1056 3568 1056
            BEGIN DISPLAY 3520 1056 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_ALU 3568 1536 R0
            BEGIN DISPLAY 16 -600 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH N
            WIRE 3952 1888 4048 1888
            WIRE 4048 1888 4064 1888
        END BRANCH
        BEGIN BRANCH OV
            WIRE 3952 1824 4048 1824
            WIRE 4048 1824 4064 1824
        END BRANCH
        BEGIN INSTANCE U_ProgCnt 560 1504 R0
            BEGIN DISPLAY 0 -248 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        IOMARKER 480 1408 Clk R180 28
        BEGIN BRANCH ZF
            WIRE 464 880 528 880
            WIRE 528 880 560 880
            BEGIN DISPLAY 528 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OV
            WIRE 464 944 512 944
            WIRE 512 944 560 944
            BEGIN DISPLAY 512 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 464 1008 512 1008
            WIRE 512 1008 560 1008
            BEGIN DISPLAY 512 1008 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH N
            WIRE 464 1072 496 1072
            WIRE 496 1072 512 1072
            WIRE 512 1072 560 1072
            BEGIN DISPLAY 512 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch(2:0)
            WIRE 464 1136 496 1136
            WIRE 496 1136 560 1136
            BEGIN DISPLAY 496 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BUSTAP 1840 1616 1936 1616
        BEGIN BRANCH Instr(18:15)
            WIRE 1936 1616 1984 1616
            WIRE 1984 1616 2032 1616
            WIRE 2032 1616 2160 1616
            BEGIN DISPLAY 1984 1616 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_MUX_Dest 2160 1280 R0
            BEGIN DISPLAY 0 -312 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH RegDest
            WIRE 2080 1120 2112 1120
            WIRE 2112 1120 2160 1120
            BEGIN DISPLAY 2112 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ZF
            WIRE 3952 1696 4048 1696
            WIRE 4048 1696 4064 1696
        END BRANCH
        IOMARKER 4064 1696 ZF R0 28
        IOMARKER 4064 1824 OV R0 28
        IOMARKER 4064 1888 N R0 28
        BEGIN BRANCH C
            WIRE 3952 1760 4048 1760
            WIRE 4048 1760 4064 1760
        END BRANCH
        IOMARKER 4064 1760 C R0 28
        BEGIN BRANCH ALUOP(2:0)
            WIRE 2432 2464 2528 2464
            WIRE 2528 2464 2624 2464
            BEGIN DISPLAY 2528 2464 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegDest
            WIRE 2432 2400 2512 2400
            WIRE 2512 2400 2624 2400
            BEGIN DISPLAY 2512 2400 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegBase
            WIRE 2432 2848 2496 2848
            WIRE 2496 2848 2624 2848
            BEGIN DISPLAY 2496 2848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Branch(2:0)
            WIRE 2432 2784 2512 2784
            WIRE 2512 2784 2624 2784
            BEGIN DISPLAY 2512 2784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH RegWr
            WIRE 2432 3040 2464 3040
            WIRE 2464 3040 2624 3040
            BEGIN DISPLAY 2464 3040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH MemWr
            WIRE 2432 2976 2464 2976
            WIRE 2464 2976 2624 2976
            BEGIN DISPLAY 2464 2976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Mem2Reg
            WIRE 2432 2912 2496 2912
            WIRE 2496 2912 2624 2912
            BEGIN DISPLAY 2496 2912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OVF
            WIRE 2432 2720 2480 2720
            WIRE 2480 2720 2624 2720
            BEGIN DISPLAY 2480 2720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_ZF
            WIRE 2432 2656 2480 2656
            WIRE 2480 2656 2624 2656
            BEGIN DISPLAY 2480 2656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(23:16)
            WIRE 1936 2528 1984 2528
            WIRE 1984 2528 2048 2528
            BEGIN DISPLAY 1984 2528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE U_CTRL 2048 2240 R0
            BEGIN DISPLAY 64 -28 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
        END INSTANCE
        BUSTAP 1840 1184 1936 1184
        BEGIN BRANCH Instr(4:0)
            WIRE 3472 1952 3504 1952
            WIRE 3504 1952 3568 1952
            BEGIN DISPLAY 3504 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Instr(13:4)
            WIRE 3472 2016 3504 2016
            WIRE 3504 2016 3568 2016
            BEGIN DISPLAY 3504 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
