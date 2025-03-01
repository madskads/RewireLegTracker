require(XML)
library(tidyverse)
library(rvest)
library(ggplot2)
library(dplyr)
library(tidyr)


#IMPORT TABLES FROM REWIRE
coercion_tests <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/coercion-tests/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Coercion Tests")
twenty_week_bans <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/20-week-bans/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "20-Week Bans")
admitting_privileges <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/admitting-privileges/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Admitting Privileges")
anti_transgender <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/anti-transgender-2/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Anti-Transgender")
buffer_zones_bubble_zones <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/buffer-zones-bubble-zones-and-clinic-access/") %>% 
  html_table() %>% 
  data.frame() %>%
  mutate(type = "Buffer Zones, Bubble Zones, and Clinic Access")
conscience_and_refusal_clauses <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/conscience-and-refusal-clauses/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Conscience and Refusal Clauses")
crisis_pregnancy_centers <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/crisis-pregnancy-centers/") %>% 
  html_table() %>%
  data.frame() %>% 
  mutate(type = "Crisis Pregnancy Centers")
dilation_and_evacuation_bans <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/dilation-and-evacuation-bans/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Dilation and Evacuation Bans")
fetal_homicide <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/fetal-homicide/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Fetal Homicide")
fetal_tissue <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/care-of-aborted-fetuses/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Fetal Tissue")
forced_ultrasound <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/forced-ultrasound/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Forced Ultrasound")
funding_restrictions_for_family_planning <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/funding-restrictions-for-family-planning/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Funding Restrictions for Family Planning")
genetic_anomalies <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/genetic-anomalies-abortion-ban/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Genetic Anomalies")
heartbeat_bans <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/heartbeat-bans/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Heartbeat Bans")
human_embryo_and_fetal_research <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/human-embryo-and-fetal-research/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Human Embryo and Fetal Research")
informed_consent <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/informed-consent/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Informed Consent")
insurance_coverage <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/insurance-coverage/") %>%
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Insurance Coverage")
later_abortion <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/later-abortion/") %>% html_table() %>% data.frame() %>% mutate(type = "Later Abortion")
lgbtq <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/lgbt/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "LGBTQ")
medication_abortion <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/medication-abortion/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Medication Abortion")
omnibus_multiple_topics <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/omnibus-multiple-topics/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Omnibus (multiple topics)")
parental_involvement <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/parental-involvement/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Parental Involvement")
partial_birth_abortion_bans <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/partial-birth-abortion-bans/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Partial Birth Abortion Bans")
personhood <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/personhood/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Personhood")
physicians_reporting_requirements <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/physicians-reporting-requirements/") %>%
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Physicians Reporting Requirements")
pregnancy_exclusion <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/pregnancy-exclusion/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Pregnancy Exclusion")
religious_freedom <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/religious-freedom/") %>%
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Religious Freedom")
religious_freedom_restoration_act <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/religious-freedom-restoration-act/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Religious Freedom Restoration Act (RFRA)")
religious_imposition <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/religious-imposition-laws/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Religious Imposition") # this table is the only with zero values. I think it is a new one they will begin tracking with.
reporting_requirements <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/reporting-requirements/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Reporting Requirements")
reproductive_health_awareness <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/reproductive-health-awareness/") %>%
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Reproductive Health Awareness")
restrictions_funding_surgery <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/restrictions-on-funding-for-hormone-therapy-and-gender-reassignment-surgery/") %>% html_table() %>% data.frame() %>% mutate(type = "Restrictions on Funding for Hormone Therapy and Gender Reassignment Surgery")
sex_ed_and_abstinence_only <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/sex-ed-and-abstinence-only/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Sex Ed and Abstinence Only")
sex_or_race_selective_bans <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/sex-or-race-selective-bans/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Sex- or Race-Selective Bans")
substance_abuse_during_pregnancy <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/substance-abuse-during-pregnancy/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Substance Abuse During Pregnancy")
targeted_regulation_of_abortion_providers <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/targeted-regulation-of-abortion-providers/") %>% html_table() %>% data.frame() %>% mutate(type = "Targeted Regulation of Abortion Providers")
telemedicine_abortion_bans <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/telemedicine-abortion-bans/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Telemedicine Abortion Bans")
waiting_periods_and_forced_counseling <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/waiting-periods-and-forced-counseling/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Waiting Periods and Forced Counseling")
wrongful_birth <- read_html("https://rewirenewsgroup.com/legislative-tracker/law-topic/wrongful-birth/") %>% 
  html_table() %>% 
  data.frame() %>% 
  mutate(type = "Wrongful Birth")


#BIND TABLES TOGETHER
rewire_leg <- rbind(coercion_tests, 
                    twenty_week_bans,
                    admitting_privileges,
                    anti_transgender, 
                    buffer_zones_bubble_zones, 
                    conscience_and_refusal_clauses, 
                    crisis_pregnancy_centers, 
                    dilation_and_evacuation_bans, 
                    fetal_homicide, fetal_tissue, 
                    forced_ultrasound, 
                    funding_restrictions_for_family_planning,
                    genetic_anomalies, heartbeat_bans,
                    human_embryo_and_fetal_research, 
                    informed_consent,
                    insurance_coverage, 
                    later_abortion,
                    lgbtq, 
                    medication_abortion, 
                    omnibus_multiple_topics, 
                    parental_involvement, 
                    partial_birth_abortion_bans, 
                    personhood, 
                    physicians_reporting_requirements,
                    pregnancy_exclusion, 
                    religious_freedom, 
                    religious_freedom_restoration_act,
                    religious_imposition, 
                    reporting_requirements, 
                    reproductive_health_awareness, 
                    restrictions_funding_surgery,
                    sex_ed_and_abstinence_only, 
                    sex_or_race_selective_bans,
                    substance_abuse_during_pregnancy, 
                    targeted_regulation_of_abortion_providers, 
                    telemedicine_abortion_bans, 
                    waiting_periods_and_forced_counseling, 
                    wrongful_birth)


#CLEAN
rewire_leg2 <- rewire_leg %>%
  # Fix Dates
  mutate(date = as.Date(Proposed, format = "%b %d, %Y")) %>%
  separate(date, c("y", "m", "d")) %>%
  # Rename
  rename(number = Number) %>%
  rename(state = State) %>%
  rename(status = Status) %>%
  rename(title = Title) %>%
  #Create Indicator Variables
  mutate(n = 1) %>%
  pivot_wider(names_from = type, values_from = n, values_fill = 0)
  
  
#View missing dates
rewire_leg_prop_miss <- rewire_leg2 %>%
  filter(Proposed == "")


#Exploring state counts
state_counts <- rewire_leg2 %>%
  group_by(state) %>%
  count(state) %>%
  arrange(desc(n))
view(state_counts)

# Rough Histogram
ggplot(rewire_leg2, aes(date, color = state)) +
  geom_histogram()


#NEXT STEPS
# Rename columns to lower case and update - DONE
# Correctly classify date values - DONE
# Merge duplicate values, preserve different "type" data - DONE
# Clean up the state column so federal legislation is tracked differently for the 330 bills.
# Classify missing values. Email rewire? Visualize where the gaps are.
# Learn how to graph each state's over time.

#EVENTUALLY
# Classify states by region
# Join with census data
# "https://rewirenewsgroup.com/legislative-tracker/law/" + title of the bill (spaces and punct replaced with "-")



#QUESTIONS
## Why are we missing so much data for 2000 - 2010 and 2010?
## Why is there a jump in 2013? Is this database well-maintained enough to use?


