   10 GOTO 10000
  100 REM FIND TYPED KEY (K) AND CLEAR IT FROM SCREEN MEMORY
  110 P = ADDR: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  120 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  130 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  140 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  150 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  160 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  170 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  180 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  190 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  200 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  210 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  220 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  230 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  240 P = P + 2: V = PEEK (P) - 128: IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN
  250 RETURN
  260 REM FOR P = ADDR TO ADDR + 26 STEP 2
  270 REM V = PEEK (P) - 128 : REM REMOVE HIGH BIT FROM SCREEN MEMORY
  280 REM IF (V = K) THEN FOUND = 1 : POKE P,160 : RETURN 
  290 REM NEXT P
  295 REM RETURN
  300 REM USE SCREEN MEMORY TO FIND UNTYPED KEYS
  310 HCOL = 1 : FOR P = ADDR TO ADDR + 26 STEP 2
  320 V = PEEK (P)
  330 IF (V > 160) THEN FOUND = 1 : VTAB VROW : HTAB HCOL : RETURN 
  340 HCOL = HCOL + 2
  350 NEXT P
  340 RETURN 
  600 REM MARK TYPED KEY
  610 FOUND = 0 : ADDR = 1576 : GOSUB 100 : REM ROW = 13
  620 IF FOUND = 0 THEN ADDR = 1832 : GOSUB 100 : REM ROW = 15
  630 IF FOUND = 0 THEN ADDR = 1104 : GOSUB 100 : REM ROW = 17
  640 IF FOUND = 0 THEN ADDR = 1360 : GOSUB 100 : REM ROW = 19
  650 IF FOUND = 0 THEN ADDR = 1616 : GOSUB 100 : REM ROW = 21
  660 RETURN 
  800 REM MOVE CURSOR TO NEXT UNTYPED KEY
  810 FOUND = 0 : ADDR = 1576 : VROW = 13 : GOSUB 300
  815 IF ( PEEK (49152)) THEN RETURN
  820 IF FOUND = 0 THEN ADDR = 1832 : VROW = 15 : GOSUB 300
  825 IF ( PEEK (49152)) THEN RETURN
  830 IF FOUND = 0 THEN ADDR = 1104 : VROW = 17 : GOSUB 300
  835 IF ( PEEK (49152)) THEN RETURN
  840 IF FOUND = 0 THEN ADDR = 1360 : VROW = 19 : GOSUB 300
  845 IF ( PEEK (49152)) THEN RETURN
  850 IF FOUND = 0 THEN ADDR = 1616 : VROW = 21 : GOSUB 300
  860 RETURN 
 1000 REM MAIN()
 1010 K$ = "" : K = 0
 1020 GOSUB 800 : REM MOVE CURSOR TO NEXT UNTYPED KEY
 1030 IF ( PEEK (49152)) THEN GET K$ : REM GETKEY()
 1040 IF (K$ > "") THEN K = ASC (K$) : VTAB 23 : HTAB 25 : PRINT K;" "
 1150 IF (K > 96) THEN K = K - 32
 1060 IF (K = 8) THEN K = ASC ("<")
 1070 IF (K = 21) THEN K = ASC (">")
 1080 IF (K = 10) THEN K = ASC ("v")
 1090 IF (K = 11) THEN K = ASC ("^")
 1100 IF (K = 32) THEN VTAB 21 : HTAB 10 : PRINT "     "
 1110 IF (K = 13) THEN VTAB 17 : HTAB 29 : PRINT "      "
 1180 IF (K = 27) THEN HOME : VTAB 24 : LIST 30000- : END 
 1190 IF (K > 32) THEN GOSUB 600 : REM MARK TYPED KEY
 1200 GOTO 1000
10000 PR# 0 : TEXT : HOME 
10010 PRINT "[=-----------------------------------=]"
10020 PRINT "        K E Y B O A R D  T E S T"
10030 PRINT "[=-----------------------------------=]"
10040 PRINT "  DETECTED KEYBOARD -> APPLE IIE"
10050 PRINT 
10060 PRINT "                 * * * "
10070 PRINT 
10180 PRINT "TYPE EACH KEY, WORKING KEYS DISAPPEAR:"
10190 PRINT "              <ESC> QUITS"
10100 PRINT "[=-----------------------------------=]"
10110 PRINT 
10120 GOSUB 10700 : REM DETECTMACHINE()
10130 GOSUB 10600 : REM DRAWSTATUSLINE()
10140 GOTO 1000
10200 REM DRAWKEYBOARD(2E) APPLE IIE/GS/IIC
10210 VTAB 12 : HTAB 1
10220 PRINT "-----------------------"
10230 PRINT "1 2 3 4 5 6 7 8 9 0 - ="
10240 PRINT "-----------------------"
10250 PRINT "  Q W E R T Y U I O P [ ]"
10260 PRINT "  -----------------------"
10270 PRINT "    A S D F G H J K L ; '   RETURN"
10280 PRINT "    -----------------------"
10290 PRINT "      Z X C V B N M , . /"
10300 PRINT "      ---------------------"
10310 PRINT "    `    SPACE    \ < > v ^"
10320 PRINT "    -----------------------"
10330 RETURN 
10400 REM DRAWKEYBOARD(II) APPLE ][/][+
10410 VTAB 12 : HTAB 1
10420 PRINT "-----------------------"
10430 PRINT "1 2 3 4 5 6 7 8 9 0 * -"
10440 PRINT "-----------------------"
10450 PRINT "  Q W E R T Y U I O P"
10460 PRINT "  -----------------------"
10470 PRINT "    A S D F G H J K L ; < > RETURN"
10480 PRINT "    -----------------------"
10490 PRINT "      Z X C V B N M , . /"
10500 PRINT "      ---------------------"
10510 PRINT "         SPACE             "
10520 PRINT "    -----------------------"
10510 RETURN 
10600 REM DRAWSTATUSLINE()
10620 VTAB 23 : HTAB 1 : PRINT "LAST KEY ASCII VALUE -> "
10630 RETURN 
10700 REM DETECTMACHINE()
10710 V = PEEK(64435): REM $FBB3
10720 VTAB 4: HTAB 24
17990 REM GOTO 19000 : REM UNCOMMENT TO TEST II+ KEYBOARD
18000 IF (V=6) THEN  PRINT "APPLE IIE/C/GS" : GOSUB 10200 : RETURN
19000 PRINT "APPLE II/II+": GOSUB 10400
19010 RETURN
20000 REM Screen Memory Map
20010 REM 0400- [=-----------------------------------=]
20020 REM 0480-         K E Y B O A R D  T E S T
20030 REM 0500- [=-----------------------------------=]
20040 REM 0580-   DETECTED KEYBOARD -> APPLE IIE PLAT
20050 REM 0600-
20060 REM 0680-                  * * *
20070 REM 0700-
20080 REM 0780- TYPE EACH KEY, WORKING KEYS DISAPPEAR :  
20090 REM 0428-               <ESC> QUITS
20100 REM 04A8- [=-----------------------------------=]
20110 REM 0528-
20120 REM 05A8- -----------------------
20130 REM 0628- 1 2 3 4 5 6 7 8 9 0 - =
20140 REM 06A8- -----------------------
20150 REM 0728-  Q W E R T Y U I O P [ ]
20160 REM 07A8-  -----------------------
20170 REM 0450-    A S D F G H J K L ; '   RETURN
20180 REM 04D0-    -----------------------
20190 REM 0550-      Z X C V B N M , . /
20200 REM 05D0-      ---------------------
20210 REM 0650-    `    SPACE    \ < > v ^
20220 REM 06D0-    -----------------------
20230 REM 0750-
20240 REM 07D0-
20250 REM SCREEN MEMORY STARTING ADDRESS FOR EACH LINE
20260 REM LINE13 :   0628H 1576D
20270 REM LINE15 :   0728H 1832D
20280 REM LINE17 :   0450H 1104D
20290 REM LINE19 :   0550H 1360D
20300 REM LINE21 :   0650H 1616D
20310 REM THE LONGEST LINE IS 26 BYTES
30000 REM ---------------------
30010 REM KEYBOARD TEST
30020 REM MIKE GOODELL
30030 REM KANSASFEST 2019
30040 REM HACKFEST
30050 REM
30060 REM DESCRIPTION:
30070 REM  KEYBOARD TEST FOR
30080 REM  GARAGE GIVEAWAY
30090 REM  MACHINES
30100 REM
30110 REM FEATURES:
30120 REM *AUTO DETECT MACHINE
30130 REM  KEYBOARD LAYOUT
30140 REM  ][+ VS //E,//C,IIGS
30150 REM
30160 REM REFERENCE:
30170 REM  CALL-A.P.P.L.E.
30180 REM ALL ABOUT APPLESOFT
30190 REM PG 240,
30200 REM APPLE II TYPE LOOKUP
