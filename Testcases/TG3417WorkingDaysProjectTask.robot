*** Settings ***
Library    Selenium2Library 
Library    String 
Library    BuiltIn 
Library    OperatingSystem
#Library    DataDriver          
Test Template     LoginTest WorkingDays          
                    
Test setup    Set Screenshot Directory    ${Path}

*** Variables ***
${url}                https://hourglass.esl-bfsi.com:8001/  
${browser}            chrome 
@{workingdays}        21-Oct-2020        22-Oct-2020         27-Oct-2020
${test name}         LoginTest 3417WorkingDaysProjectTask   
${Path}             C:/Users/RDMD/Desktop/RobotFrameworkScreenshots/${test name}

*** Test Cases ***
LoginTest WorkingDays               7412         Suprithi2716

                                    
                        
*** Keywords ***
LoginTest WorkingDays
    [Arguments]       ${username}    ${password}
    
    Create Directory    C:/Users/RDMD/Desktop/RobotFrameworkScreenshots/${test name}
   
    Open Browser       ${url}    ${browser}
    Maximize Browser Window
    ${title_var}    Get window titles
    
    #Click Button    id=details-button  
    #Sleep    2    
    #Click Link        id=proceed-link    
    Input Text        id=id_username    ${username}
    Input Password    id=id_password    ${password}
    Click Image    /static/css/images/btn_go.png
    #handle alert    accept
    #Alert Should not Be Present    text=Selected date is holiday.
    
    FOR    ${DailyDate}    IN    @{workingdays}        
        Log    ${DailyDate}      
        Sleep    2    
        Input Text      id=selected_date    ${DailyDate}
        Sleep    1   
        Press Keys    id=selected_date    ENTER    
        Sleep    3    
        
        Click Image    /static/css/images/icon_addlink.gif   
         
        Click Button       id=dproject_task 
        Sleep    1    
           
        Select Checkbox      project1    
        
        Sleep    1
        
        Click Button    Ok  
        
        Click Button      effort_time${DailyDate}1
        Sleep    1    
        
        Double Click element    //*[@id="ui-timepicker-div"]/table/tbody/tr/td[1]/table/tbody/tr[2]/td[3]/a
        
        Sleep    1    
        
        Click Button   Save
        Capture Page Screenshot    ${test name}_${username}_${DailyDate}_Save.png
        
        Sleep    1
        #Click Button   Send for approval
        #Sleep    1  
        #handle alert    accept
        #Alert Should Be Present    text=Are you sure you want to send for approval?    action=ACCEPT
        #Sleep    1         
        #Capture Page Screenshot    ${test name}_${username}_${DailyDate}_Sendforapproval.png
        
        
        
        
        
        
        
    END
    
    Click link    /tsuser/logout/ 
    
    Close Browser
     
