10  REM *****MORGAG*****BUSINESS PROGRAM  
20  REM MORGAG**********VERSION #1 (7/31/69)*****MORTGAGE ANALYSIS*****
30  REM
40  PRINT "*  MORTGAGE ANALYSIS  *"
50  PRINT 
60  PRINT "IF YOU WANT TO FIND:"
70  PRINT "     THE RATE, TYPE '1'"
80  PRINT "     THE LIFE, TYPE '2'"
90  PRINT "     THE AMOUNT BORROWED, TYPE '3'"
100  PRINT "     THE MONTHLY PAYMENT, TYPE '4'"
110  PRINT "WHICH DO YOU WANT";
120  INPUT Z
130  PRINT 
140  IF Z=1 THEN 220
150  PRINT "WHAT IS THE NOMINAL ANNUAL RATE USING DECIMAL NOTATION";
160  INPUT R
170  IF R<1 THEN 200
180  PRINT "IT APPEARS THAT YOU HAVE FORGOTTEN TO USE DECIMAL NOTATION"
190  GOTO 150
200  PRINT 
210  IF Z=2 THEN 260
220  PRINT "WHAT IS THE LIFE OF THE MORTGAGE: YEARS, MONTHS";
230  INPUT Y,M
240  PRINT 
250  IF Z=3 THEN 300
260  PRINT "WHAT IS THE AMOUNT TO BE BORROWED";
270  INPUT A
280  PRINT 
290  IF Z=4 THEN 330
300  PRINT "WHAT IS THE AMOUNT OF ONE MONTHLY PAYMENT";
310  INPUT P
320  PRINT 
330  PRINT "WHAT IS THE MONTH (JAN=1,ETC.), AND YEAR IN WHICH THE MORTGAGE LOAN IS"
340  PRINT "TO BE MADE";
350  INPUT T1,T2
360  PRINT 
370  PRINT "FOR HOW MANY CALENDAR YEARS DO YOU WANT THE MORTGAGE TABLE PRINTED";
380  INPUT T3
390  PRINT 
400  PRINT "TYPE A ONE (1) IF YOU WANT ONLY AN ANNUAL SUMMARY OF THE MORTGAGE"
410  PRINT "TABLE; TYPE A ZERO (0) FOR A MONTHLY TABLE";
420  INPUT Z1
430  PRINT 
440  IF Z=2 THEN 470
450  N=12*Y+M
460  IF Z=1 THEN 660
470  R1=R/12
480  IF Z=3 THEN 580
490  IF Z=4 THEN 610
500  IF (A*R1/P)<1 THEN 530
510  PRINT "THE FIRST MONTHS PAYMENT WILL NOT EVEN COVER ITS INTEREST CHARGE"
520  RUN "DIR" 
530  N=-(LOG(1-(A*R1)/P))/LOG(1+R1)
540  N=INT(N)+1
550  Y=INT(N/12)
560  M=N-12*Y
570  GOTO 770
580  A=(P*(1-1/((1+R1)^N)))/R1
590  A=INT((A+5)/10)*10
600  GOTO 770
610  P=(A*R1)/(1-1/((1+R1)^N))
620  P=(P*1000+5)/10
630  P=INT(P)
640  P=P/100
650  GOTO 770
660  R1=0
670  FOR O=1 TO 5
680  FOR I=1 TO 10
690  Q=I*(1/(10^O))+R1
700  C=(P*(1-1/((1+Q)^N)))/Q
710  IF C<A THEN 730
720  NEXT I
730  R1=Q-(1/(10^O))
740  NEXT O
750  R1=INT(24000*R1+.5)/24000
760  R=12*R1
770  PRINT 
780  IF 12*P>(R*A+1) THEN 830
790  PRINT "YOUR FIRST YEARS'S PAYMENTS ARE"12*P
800  PRINT "THE FIRST YEARS'S INTEREST IS"R*A
810  PRINT "THEREFORE, THE LIFE OF THE MORTGAGE IS UNDEFINED"
820  RUN "DIR" 
830  PRINT "***********************************************************************"
840  PRINT 
850  PRINT "                           MORTGAGE TERMS"
860  PRINT 
870  PRINT "     NOMINAL ANNUAL RATE =";R*100;"PERCENT"
880  PRINT "     LIFE OF MORTGAGE =";Y;"YEARS,";M;"MONTHS"
890  PRINT "     AMOUNT BORROWED = $";A
900  PRINT "     MONTHLY PAYMENT = $";P
910  IF Z=1 THEN 950
920  IF Z=3 THEN 990
930  IF Z=2 THEN 970
940  GOTO 1000
950  PRINT " (NOTE: THE ANNUAL RATE HAS BEEN ROUNDED TO NEAREST 1/100 PERCENT)"
960  GOTO 1000
970  PRINT " (NOTE: THE MORTGAGE LIFE HAS BEEN ROUNDED UPWARD TO NEAREST MONTH)"
980  GOTO 1000
990  PRINT " (NOTE: THE AMOUNT BORROWED ROUNDED TO NEAREST $10)"
1000  PRINT 
1010  PRINT "----------------------------------------------------------------------"
1020  PRINT 
1030  PRINT "                           MORTGAGE TABLE"
1040  PRINT 
1050  PRINT 
1060  Z2=0
1070  S1=0
1080  S2=0
1090  IF T1=12 THEN 1120
1100  M2=T1
1110  GOTO 1140
1120  T2=T2+1
1130  M2=0
1140  M3=M2+1
1150  IF Z1=1 THEN 1230
1160  PRINT "   ","BEGINNING"
1170  PRINT "   ","PRINCIPAL","   ","PRINCIPAL"
1180  PRINT "MONTH","OUTSTANDING","INTEREST","REPAYMENT"
1190  PRINT 
1200  PRINT 
1210  PRINT "   ","FOR THE CALENDAR YEAR"T2
1220  GOTO 1280
1230  PRINT "   ","   ","   ","ENDING"
1240  PRINT "   ","   ","PRINCIPAL","PRINCIPAL"
1250  PRINT "YEAR","INTEREST","REPAYMENT","OUTSTANDING"
1260  PRINT 
1270  PRINT 
1280  FOR M1=M3 TO 12*T3
1290  I1=A*R1
1300  I1=(I1*1000+5)/10
1310  I1=INT(I1)
1320  I1=I1/100
1330  IF P<(A+I1) THEN 1360
1340  P1=A
1350  GOTO 1370
1360  P1=P-I1
1370  A1=A
1380  A=A1-P1
1390  S1=S1+I1
1400  S2=S2+P1
1410  M2=M2+1
1420  IF Z1=1 THEN 1590
1430  PRINT M2,A1,I1,P1
1440  IF M2=12 THEN 1470
1450  IF A>0 THEN 1690
1460  Z2=1
1470  PRINT 
1480  PRINT "     INTEREST PAID DURING";T2;TAB(42);"=";S1
1490  PRINT "     PRINCIPLE REPAID DURING";T2;TAB(42);"=";S2
1500  PRINT "     PRINCIPLE OUTSTANDING AT YEAR END";TAB(42);"=";A
1510  IF Z2=1 THEN 1700
1520  T2=T2+1
1530  PRINT 
1540  PRINT "-----"
1550  PRINT 
1560  IF M1=12*T3 THEN 1700
1570  PRINT "   ","FOR THE CALENDAR YEAR"T2
1580  GOTO 1660
1590  IF M2=12 THEN 1620
1600  IF A>0 THEN 1690
1610  Z2=1
1620  PRINT T2,S1,S2,A
1630  T2=T2+1
1640  IF M1=12*T3 THEN 1700
1650  IF Z2=1 THEN 1700
1660  S1=0
1670  S2=0
1680  M2=0
1690  NEXT M1
1700  PRINT "**********************************************************************"
1710  REM RUN "DIR" 
2000 REM ----------------------------------
2010 REM Commented out RUN "DIR" 
2999 END