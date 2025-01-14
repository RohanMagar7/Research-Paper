


required_details <- data %>% 
  select(NAME.OF.THE.APPLICANT,PROGRAMME.NAME, CATEGORY,,MARITAL.STATUS,
         GENDER, EMAIL ,FAMILY.INCOME, UG.COURSE.NAME, 
         DOB.YEAR, AGE..AS.REFERENCED.,UG.PASSING.YEAR,
         HOSTEL.REQUIRED  ,XII.PERCENTAGE ,XII.PASSING.YEAR
         ,PINCODE ,PERMANENT.ADDRESS.LINE.1 ,PERMANENT.ADDRESS.LINE.2 ,
         COUNTRY,STATE , Are.you.Citizen.of.India. ,MINORITY ,RELIGION,
         ,PLACE.OF.BIRTH..COUNTRY. ,PLACE.OF.BIRTH..STATE., ,MOBILE,
         , UG.QUALIFICATION.STATUS,
         UG.PERCENTAGE, UG.total.attempt, UG.SUBJECT.COMBINATION,
         PG.COURSE.NAME,PG.Year.of.Passing.Appeared.Appearing.final.exam,
         , PG.QUALIFICATION.STATUS, PG.PERCENTAGE,
         PG.total.attempt, PG.SUBJECT.COMBINATION)


# view in the table format

view(required_details)


# view in the table format

view(required_details)



# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------
# data separation

any(is.na(required_details$PG.PERCENTAGE))


sum(is.na(required_details$PG.PERCENTAGE))






##*********** who applied for PG OR other Ocational training programme or diploma ***************

phd <- required_details %>%
  select(PROGRAMME.NAME , starts_with('DOCTOR OF PHILOSOPHY'))

view(phd)

count_of_above_pg <- nrow(phd)


print(nrow(below_ug_stud) + nrow(pg_stud) + count_of_above_pg)


nrow(data)

#ug_done_student <- required_details %>%
#  filter(UG.QUALIFICATION.STATUS == c('APPEARING','PASSED') & !PG.QUALIFICATION.STATUS == c('APPEARING','PASSED'))

#view(ug_done_student)
#nrow(ug_done_student)




















