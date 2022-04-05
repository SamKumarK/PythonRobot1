

*** Settings ***
Library  SeleniumLibrary
Library  Screenshot
Library  OperatingSystem


*** Variables ***
${browser}  chrome
${url}   https://www.google.com/

*** Test Cases ***
Google
    Open Browser    ${url}   ${browser}

    Maximize Browser Window
    Press Keys   xpath://input[@name='q']    Python+ENTER
    ${AllLinksCount}=  get element count  xpath://a//div/child::cite[contains(text(),'https')]/parent::div//preceding-sibling::h3
   # log to console   ${AllLinksCount}


   @{LinkItems}     create list

   FOR     ${i}  IN RANGE  1    ${AllLinksCount}+1
   ${linkText}=     get text    xpath:(//a//div/child::cite[contains(text(),'https')]/parent::div//preceding-sibling::h3)[${i}]
   ${linkUrl}=  get text     xpath:(//a//div/child::cite[contains(text(),'https')])[${i}]
   log to console   ${linkText} - ${linkUrl}

   capture page screenshot  ./screenshot${i}.png

    END

#    FOR     ${i}  IN RANGE  1    5
#   ${linkUrl}=  get text     xpath:(//div[@id='rso']//h3//following-sibling::div//cite)
#   log to console  ${i} ${linkUrl}
#
#   END








*** Keywords ***
