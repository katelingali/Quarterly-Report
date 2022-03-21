library(readr)
library(dplyr)
library(readxl)
library(ggplot2)

#open the data sheet from the excel file CRO line list

crab <- read_excel("C:/Users/kgali/Downloads/CRO test data2.xlsx", 
                            sheet = "CRAB")
crpa <- read_excel("C:/Users/kgali/Downloads/CRO test data2.xlsx", 
                                 sheet = "CRPA")
cre <- read_excel("C:/Users/kgali/Downloads/CRO test data2.xlsx", 
                                 sheet = "CRE")

#Rename column names to be the first row data
names(crab) <- crab[1,]
crab <- crab[-1,]
crab <- crab %>%
  select('DCLS - ID confirmation', 'Date received at DCLS', 'KPC', 'NDM', 'VIM', 'OXA-48', 'IMP')
head(crab)

names(crpa) <- crpa[1,]
crpa <- crpa[-1,]
crpa <- crpa %>%
  select('DCLS - mCIM Result', 'DCLS - ID confirmation', 'Date received at DCLS', 'KPC', 'NDM', 'VIM', 'OXA-48', 'IMP')
head(crab)

names(cre) <- cre[1,]
cre <- cre[-1,]
cre <- cre %>%
  select('DCLS - mCIM Result', 'DCLS - ID confirmation', 'Date received at DCLS', 'KPC', 'NDM', 'VIM', 'OXA-48', 'IMP')
head(cre)

# Calculating and graphing MCIM + data from CRE/CRPA
# How to combine values together

total_mcim_pos <- cre %>%
  filter(`DCLS - mCIM Result`== 'Positive') %>%
  summarize(mcim_pos = n())
total_mcim_pos

mcim_pos_crpa <- crpa %>%
  filter(`DCLS - mCIM Result`== 'Positive') %>%
  summarize(mcim_pos = n())
mcim_pos_crpa

#calculating mCIM + by CRE species
# Doesn't work
cre_species_mcim <- cre %>%
  filter(`DCLS - mCIM Result` == 'Positive') %>%
  group_by(`DCLS - ID confirmation`, na.rm = FALSE)
cre_species_mcim

#bar graph
#doesn't work
bar <- ggplot(data = cre_species_mcim, aes(x = 'DCLS - ID confirmation')) + geom_bar()
bar

#Combine all data into one table
cro <- cre %>%
  full_join(crpa, all = TRUE) %>%
  full_join(crab, all= TRUE)

# Total # of cro performed
total_cro <- cro %>%
  summarize(total_count=n())
total_cro

# count distinct species
species_cro <- cro %>%
  summarize(diff_species = n_distinct(`DCLS - ID confirmation`))
species_cro


 