*** Settings ***
#Library    SeleniumLibrary
Library    Selenium2Library    
Library    String
Library    BuiltIn 
Library    OperatingSystem
#Library    DataDriver          
Test Template    LoginTest Holidays
Test setup    Set Screenshot Directory    ${Path}    


*** Variables ***
${url}           https://hourglass.esl-bfsi.com:8001/  
${browser}       chrome      
@{Holidays}         19-Oct-2020      20-Oct-2020
${test name}    LoginTest Holidays   
${Path}          C:/Users/RDMD/Desktop/RobotFrameworkScreenshots/${test name}


*** Test Cases ***
LoginTest Holidays               lakshminarayanan.radhakrishnan@sqs.com       Ln$$Oct2020
                                 supraja.ramanujam@sqs.com                    Suprithi2716
*** Keywords ***
LoginTest Holidays
    [Arguments]       ${username}    ${password}
   
    Create Directory    C:/Users/RDMD/Desktop/RobotFrameworkScreenshots/${test name}
    Open Browser       ${url}    ${browser}
    
    Maximize Browser Window
    #Click Button    id=details-button  
    #Sleep    2    
    #Click Link        id=proceed-link    
    Input Text        id=id_username    ${username}
    Input Password    id=id_password    ${password}
    Click Image    /static/css/images/btn_go.png
    
    #handle alert    accept    Timeout=2 s
    
    FOR    ${DailyDate}    IN    @{Holidays}        
        Log    ${DailyDate}      
        Sleep    2    
        Input Text      id=selected_date    ${DailyDate}    
        Press Keys    id=selected_date    ENTER    
        Sleep    3    
        Select Checkbox    leave${DailyDate}    
        Sleep    1  
        Click Button   Save
        Sleep    1  
        Capture Page Screenshot    ${test name}_${username}_${DailyDate}_save.png
        #Click Button   Send for approval
        #Sleep    1  
        #handle alert    accept
        #Sleep    1         
        # Capture Page Screenshot    ${test name}_${username}_${DailyDate}_Sendforapproval.png
        
        
    END
    
    Click link    /tsuser/logout/ 
    
    Close Browser    
    
    

    
     



    


    