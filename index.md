---
title       : Currency Converter
subtitle    : Hosted on shinyapps.io
author      : Aadil Rai Mehra
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : prettify  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Description

The currency converter app is used to convert USD into INR as per the currency conversion on a date specified by the user.  
  
It also makes an assumption that the currency conversion fee (if applicable) is equal to INR 10, and accordingly reduces this from the converted amount.  
  
The app is useful for people who want to know the USD-INR conversion on a hostorical date, so as to settle previous dues.

---

## Input Data

The app requires the user to provide the following information:   
- An amount in USD that needs to be converted   
- A date, as on which the USD-INR conversion rate will be calculated  
- A Yes / No response to whether a conversion fee is applicable

---

## Output

Based on the data provided by the user, the app gives the following output:   
- Confirms the USD amount and date entered by the user  
- Gives the USD-INR conversion rate according to the date specified by the user **(currently the app only has data from November 01, 2014 to November 23, 2014)**   
- Adds a conversion fee based on the selection of Yes / No provided by the user in the radio button   
- Calculates the net amount received using the formula  
Amount Received = USD Amount * Conversion Rate - Conversion Fee

--- 

## Example 

Assume the user gives the following input   
Amount : USD 10   
Date : 20 November 2014  
Conversion Fee Applicable : Yes   


According to this input, R will make the following calculations

```r
Amount.Entered <- 10
Conversion.Date <- as.Date("2014-11-20")
Conversion.Rate <- 59.8 #this rate is obtained from an if-else function defined in server.R
Conversion.Fee <- 10 #this amount is obtained from a function defined in server.R
Net.Amount <- (Amount.Entered*Conversion.Rate) - Conversion.Fee
print(Net.Amount)
```

```
## [1] 588
```
