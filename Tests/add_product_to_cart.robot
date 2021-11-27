*** Settings ***
Documentation    Add product to cart
Library           SeleniumLibrary  timeout=10   implicit_wait=1.5   run_on_failure=Capture Page Screenshot  run_on_failure=close  screenshot_root_directory=Screenshots

*** Variables ***
${SERVER}                   https://amazon.com
${BROWSER}                  Chrome https://${SERVER}/
${SCREENSHOTNAME}           amazon-screenshot-{index}.png


*** Test Cases ***
Add product to cart
    OPEN BROWSER    ${SERVER}
    INPUT TEXT  id:twotabsearchtextbox  iPhone 12 pro
    CLICK BUTTON    id:nav-search-submit-button
    CLICK LINK       Apple iPhone 12 Pro, 128GB, Pacific Blue - Fully Unlocked (Renewed)
    PAGE SHOULD CONTAIN ELEMENT     id:nav-cart-count       0
    CLICK BUTTON    id:add-to-cart-button
    PAGE SHOULD CONTAIN     Added to Cart
    PAGE SHOULD CONTAIN ELEMENT     id:hlb-ptc-btn-native      Proceed to checkout (1 item)
    PAGE SHOULD CONTAIN ELEMENT     id:nav-cart-count       1
    CLICK LINK    id:hlb-view-cart-announce
    PAGE SHOULD CONTAIN     Apple iPhone 12 Pro, 128GB, Pacific Blue - Fully Unlocked (Renewed)
    PAGE SHOULD CONTAIN     Subtotal (1 item)
    PAGE SHOULD CONTAIN     $998.00
    CLOSE BROWSER
