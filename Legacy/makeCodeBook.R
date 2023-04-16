pacman::p_load(tidyverse, codebookr, codebook)
setwd("D:/Projects/QTM150")
salary <- read.csv("./Datasets/salary.csv")
# 
# cb <- codebookr::codebook(salary,
#                           title = "Salary Codebook", 
#                           subtitle = "by Grayson Stark, Lance , Kristy Tran", 
#                           description = "This codebook was created for the final project of our QTM 150 class. Here is a basic description of our study, our methods, our sample, and protocols.")
# print(cb, path = "D:/Projects/QTM150/codebook.docx")
# capture.output(cb, file="test.txt")

salary <- salary %>% 
  rename(annual_salary = What.is.your.annual.salary...You.ll.indicate.the.currency.in.a.later.question..If.you.are.part.time.or.hourly..please.enter.an.annualized.equivalent....what.you.would.earn.if.you.worked.the.job.40.hours.a.week..52.weeks.a.year..,
         compensation = How.much.additional.monetary.compensation.do.you.get..if.any..for.example..bonuses.or.overtime.in.an.average.year...Please.only.include.monetary.compensation.here..not.the.value.of.benefits.)

codebook::codebook(salary)
