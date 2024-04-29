DATA Q1;
a = -(2+3/2)*4;
b = Exp(-3**2/4-7)*2;
c = -2**4 + 4/2*9;
d = 10*2 >< 3**2;
e = 2 + 3 = 6 | 3 & 0;
f = 3 gt 2 = 1;
g = ^(-3) + 3;
h = 4 in (1, 2, 3, 4, 5) and 2;
i = 4 > 3 >= 2;
j = not ('ab ' = 'a' || "b");
    
PROC PRINT;
RUN;

/* Q1
(a) -(2+3/2)*4 
    3  2 1  4
    = -14
    
(b) Exp(-3**2/4-7)*2 
    5   2 1  3 4  6
    = 0.0001922233
    
(c) -2**4 + 4/2*9 
    2 1   5  3 4
    = 2
    
(d) 10*2 >< 3**2 
      3  2   1 
    = 20
    
(e) 2 + 3 = 6 | 3 & 0 
      1   2   4   3
     = 0
     
(f) 3 gt 2 = 1 
   (3 gt 2)&(2 = 1)
      1    3   2
    = 0
    
(g) ^(-3) + 3 
    2 1   3
    = 3
    
(h) 4 in (1, 2, 3, 4, 5) and 2 
      1                  2    
    = 1
    
(i) 4 > 3 >= 2 
   (4 > 3)&(3 >= 2)
      1   3   2
    = 1
    
(j) not ('ab ' = 'a' || "b") 
    3          2         1
    = 0
*/


/* Q2 */
/* Q2(a) 
X1 = mdy(1,1,year+1) - mdy(1,1,year);
*/
DATA Q2a;
   YEAR = 2000;
   X1 = mdy(1,1,year+1) - mdy(1,1,year);
   
PROC PRINT;
run;


/* Q2(b) 
if countw(X2) = 2 then
      name = scan(X2,1) || ' ' || substr(scan(X2,2),1,1) || '.';
   else
      name = scan(X2,1) || ' ' || substr(scan(X2,2),1,1) || '. ' || substr(scan(X2,3),1,1) || '.';
*/
DATA Q2b;
   X2 = 'Chan Tai Man';
   /* X2 = 'Chan Keung'; */
   if countw(X2) = 2 then
      name = scan(X2,1) || ' ' || substr(scan(X2,2),1,1) || '.';
   else
      name = scan(X2,1) || ' ' || substr(scan(X2,2),1,1) || '. ' || substr(scan(X2,3),1,1) || '.';

PROC PRINT;
run;


/* Q2(c) 
%let discriminant = (&b)**2 - 4*(&a)*(&c);
if &discriminant >= 0 then
      X3 = (-&b + sqrt(&discriminant))/(2*&a);
   else X3 = .;
*/
DATA Q2c;
   /* ax2 + bx + c = 0 */
   %let a = 1;
   %let b = 2;
   %let c = 1;

   /* Calculate discriminant */
   %let discriminant = (&b)**2 - 4*(&a)*(&c);

   /* If the discriminant is non-negative, then the polynomial has real roots*/
   if &discriminant >= 0 then
      X3 = (-&b + sqrt(&discriminant))/(2*&a);
   else X3 = .; /* Set X3 to missing value */

PROC PRINT;
run;


/* Q2(d) 
pi = constant('pi');
c = sqrt(a**2 + b**2 - 2 * a * b * cos(angle_C * pi / 180));
*/
DATA Q2d;
   pi = constant('pi');
   a = 3;
   b = 4;
   angle_C = 90;

   c = sqrt(a**2 + b**2 - 2 * a * b * cos(angle_C * pi / 180));

PROC PRINT;
run;


/* Q2(e) 
   if not missing(Y) then
          Y = substr(Y,1,length(Y)-1) || X4;
   else Y = X4;
*/
DATA Q2e;
   Y = 'abc';
   /* Y = ''; */
   X4 = 'Z';

   /* Replace the last non-blank character of y with x4 */
   if not missing(Y) then
          Y = substr(Y,1,length(Y)-1) || X4;
   else Y = X4; /* Set Y = X4 if Y is empty */

PROC PRINT;
run;


/* Q3 */
data school;
input Age Quiz $1. Midterm Final;

if Age = 12 then Grade = 6;
   else if Age = 13 then Grade = 8;
   
if Quiz = 'A' then Quiz_Grade = 95;
   else if Quiz = 'B' then Quiz_Grade = 85;
   else if Quiz = 'C' then Quiz_Grade = 75;
   else if Quiz = 'D' then Quiz_Grade = 70;
   else if Quiz = 'F' then Quiz_Grade = 65;
   
/* Compute a course grade as a weighted average */
Course = 0.2 * Quiz_Grade + 0.3 * Midterm + 0.5 * Final;

datalines;
12 A 92 95
12 B 88 88
13 C 78 75
13 A 92 93 
12 F 55 62
13 B 88 82

/* PROC PRINT; */
run; 


/* Q4 */
/* Q4(a) */
/* Create Subset_A */
DATA Subset_A;
	libname A '/home/u63839646/sasuser.v94/STAT2005';
	set A.Blood;
	where Gender = 'Female' and BloodType = 'AB';
	Combined = 0.001 * WBC + RBC;
PROC PRINT;

/* Create Subset_B */
DATA Subset_B;
    libname A '/home/u63839646/sasuser.v94/STAT2005';
	set A.Blood;
	Combined = 0.001 * WBC + RBC;
	if Gender = 'Female' and BloodType = 'AB' and Combined >= 14;
PROC PRINT;
run;

/* Q4(b) */
DATA Lowmale Lowfemale;
    libname B '/home/u63839646/sasuser.v94/STAT2005';
	set B.Blood;
    where Chol < 100;
    if Gender = 'Male' then output Lowmale;
    else if Gender = 'Female' then output Lowfemale;
run;

/*
proc print data=Lowmale;
run;

proc print data=Lowfemale;
run;
*/