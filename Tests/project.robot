*** Settings ***
Documentation     Reusable keywords and variables.
Library           SeleniumLibrary  timeout=10   implicit_wait=1.5   run_on_failure=Capture Page Screenshot  run_on_failure=close  screenshot_root_directory=Screenshots


*** Variables ***
${SERVER}                   https://amazon.com
${BROWSER}                  Firefox https://${SERVER}/
${SCREENSHOTNAME}           amazon-screenshot-{index}.png


*** Test Cases ***
Search product
    OPEN BROWSER    ${SERVER}
    INPUT TEXT  id:twotabsearchtextbox  iPhone
    CLICK BUTTON    id:nav-search-submit-button
    PAGE SHOULD CONTAIN     iphone
    CLOSE ALL BROWSERS

Invalid Login
    OPEN BROWSER    ${SERVER}
    CLICK LINK      id:nav-link-accountList
    INPUT TEXT      id:ap_email     mail@gmail.com555
    CLICK BUTTON    id:continue
    PAGE SHOULD CONTAIN     There was a problem
    CLOSE ALL BROWSERS