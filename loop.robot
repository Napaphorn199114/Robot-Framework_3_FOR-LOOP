*** Settings ***
Library    String

*** Test Cases ***
For-Loop-In-Range
    FOR    ${INDEX}    IN RANGE    1    5
        Log To Console    \n${INDEX}
        ${RANDOM_STRING} =        Generate Random String    ${INDEX}    #Generate Random String keyword Library string
        Log To Console    ${RANDOM_STRING}
    END


For-Loop-Elements
    @{ITEMS}    Create List    Star Trek    Star Wars    Pottor    Rodon
    FOR    ${ELEMENT}    IN    @{ITEMS}
        Log To Console    \n${ELEMENT}
        ${ELEMENT}    Replace String    ${ELEMENT}    ${SPACE}    ${EMPTY}   #Replace String  keyword Library string ,${SPACE}    ${EMPTY}  ไม่ให้มีช่องว่าง
        Log To Console    ${ELEMENT}
        
    END

For-Loop-Exiting
    @{ITEMS}    Create List    Good Element 1    Good Element 2    Break On Me    Good Element 3
    FOR    ${ELEMENT}    IN    @{ITEMS}
        Log To Console    \n${ELEMENT}
        Run Keyword If    '${ELEMENT}' == 'Break On Me'    Exit For Loop
        Log To Console    Do more actions here ...

    END