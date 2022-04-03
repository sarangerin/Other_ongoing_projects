#delimit ;

   infix
      year     1 - 20
      wwwhr    21 - 40
      tvhours  41 - 60
      chldidel 61 - 80
      size     81 - 100
      educ     101 - 120
      age      121 - 140
      childs   141 - 160
      hrs1     161 - 180
      id_      181 - 200
      conrinc  201 - 220
using G:\SOC501LAB\stata\GSS.dat;

label variable year     "Gss year for this respondent                       ";
label variable wwwhr    "Www hours per week";
label variable tvhours  "Hours per day watching tv";
label variable chldidel "Ideal number of children";
label variable size     "Size of place in 1000s";
label variable educ     "Highest year of school completed";
label variable age      "Age of respondent";
label variable childs   "Number of children";
label variable hrs1     "Number of hours worked last week";
label variable id_      "Respondent id number";
label variable conrinc  "Respondent income in constant dollars";


label define gsp001x
   999      "No answer"
   998      "Don't know"
   -1       "Not applicable"
;
label define gsp002x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp003x
   9        "Dk,na"
   8        "As many as want"
   7        "Seven+"
   -1       "Not applicable"
;
label define gsp004x
   99       "No answer"
   98       "Don't know"
   97       "Not applicable"
;
label define gsp005x
   99       "No answer"
   98       "Don't know"
   89       "89 or older"
;
label define gsp006x
   9        "Dk na"
   8        "Eight or more"
;
label define gsp007x
   99       "No answer"
   98       "Don't know"
   -1       "Not applicable"
;
label define gsp008x
   999999   "No answer"
   999998   "Dont know"
   0        "Not applicable"
;


label values wwwhr    gsp001x;
label values tvhours  gsp002x;
label values chldidel gsp003x;
label values educ     gsp004x;
label values age      gsp005x;
label values childs   gsp006x;
label values hrs1     gsp007x;
label values conrinc  gsp008x;

recode educ (99 98 97 =.)
ci mean educ, level(90)
ttest educ=12, level (90)


