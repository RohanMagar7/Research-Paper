


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

##******************************* who applied for PG OR other ********************************


pg_stud <- required_details %>%
  filter(!startsWith(PROGRAMME.NAME,'DOCTOR OF PHILOSOPHY')) %>%
  filter(!startsWith(PROGRAMME.NAME, 'BACHELOR') ) %>%
  filter(!startsWith(PROGRAMME.NAME,'ADVANCE DIPLOMA ')) %>%
  filter(!startsWith(PROGRAMME.NAME, 'DIPLOMA')) %>%
  filter(!startsWith(PROGRAMME.NAME, 'CERTIFICATE')) %>%
  filter(!startsWith(PROGRAMME.NAME,'PG CERTIFICATE')) %>%



# filter(startsWith(PROGRAMME.NAME,'M. VOC.'))


  
#!!!!!!!!!!!!!!!!! PG CERTIFICATE courses are not full time PG programme 
# !!!!!!!!!!!!!! there is no UG Details  that's why PG CERTIFICAT'S are excluded from the pg dataset
  
  
  
  
pg_not_having_ug <- pg_stud %>%
  filter(is.na(UG.PERCENTAGE))



view(pg_not_having_ug)


any(is.na(pg_stud$UG.PERCENTAGE))

sum(is.na(pg_stud$UG.PERCENTAGE))




view(pg_stud)

view(table(pg_stud$PROGRAMME.NAME))



nrow(pg_stud)

view(not_pg_done)

count_of_ug_done_students <- nrow(not_pg_done)


#ug_done_student <- required_details %>%
#  filter(UG.QUALIFICATION.STATUS == c('APPEARING','PASSED') & !PG.QUALIFICATION.STATUS == c('APPEARING','PASSED'))

#view(ug_done_student)
#nrow(ug_done_student)



