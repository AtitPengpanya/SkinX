*** Keywords ***
#Keyword Description   :  Set config mobile and open app
#Keyword Argument      :  -
#Keyword Return        :  -

Open Application Android
    Open Application    ${remote_url}
    ...     platformName=${platformName}     
    ...     deviceName=${deviceName}  
    ...     platformVersion=${platformVersion} 
    ...     appPackage=${appPackage}
    ...     appActivity=${appActivity}

#Keyword Description   :  Verfy Display Element on screen
#Keyword Argument      :  -
#Keyword Return        :  -
Verfy Display Element
    Wait Until Page Contains Element    accessibility_id=Todo List                  30s
    Wait Until Page Contains Element    xpath=${Text_input}                         30s
    Wait Until Page Contains Element    xpath=//android.widget.Button               30s
#Keyword Description   :  Input Text,Verify text input
#Keyword Argument      :  ${count_input}  total list app (default=1)
#Keyword Return        :  -
Tap Input Text
    [Arguments]       ${count_input}=1  

    Tap     xpath=${Text_input}
    ${status_bar}     Run Keyword And Return Status       Wait Until Page Does Not Contain Element    id=android:id/navigationBarBackground     10s
    IF      '${status_bar}' == 'True' and '${count_input}'=='1'
        Input Text      xpath=${Text_input}       Test_add1
        Tap             xpath=//android.widget.Button
        Wait Until Page Contains Element         xpath=//android.view.View[@content-desc="Test_add1"]        10s
    ELSE
        FOR   ${i}   IN RANGE   ${count_input}
                Input Text      xpath=${Text_input}       Test_add${i}
                Tap             xpath=//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.widget.Button    
                ${status_list}     Run Keyword And Return Status     Wait Until Page Contains Element          xpath=//android.view.View[@content-desc="Test_add${i}"]        10s
        END
    END

#Keyword Description   :  CheckBox , Delete verify app delete
#Keyword Argument      :  ${type_del}  Delete list app (default=1)
#Keyword Return        :  -
Tap CheckBox And Delete
    [Arguments]       ${type_del}=1  
    IF      '${type_del}'=='1'
        Tap       xpath=${CheckBox}
        Wait Until Page Contains Element                xpath=//android.view.View[@content-desc="Test_add1"]//android.widget.Button             10s
        Tap                                             xpath=//android.view.View[@content-desc="Test_add1"]//android.widget.Button
        Wait Until Page Does Not Contain Element        xpath=//android.view.View[@content-desc="Test_add1"]
    ELSE IF  '${type_del}'=='ALL'
        ${checkbox_count}     Get Matching Xpath Count     xpath=${CheckBox}
        FOR   ${i}   IN RANGE   ${checkbox_count}
            Wait Until Page Contains Element    xpath=//android.view.View[@content-desc="Test_add${i}"]//android.widget.Button             30s
            Tap       xpath=//android.view.View[@content-desc="Test_add${i}"]//android.widget.Button
            Wait Until Page Does Not Contain Element        xpath=//android.view.View[@content-desc="Test_add${i}"]
        END
    ELSE
        FOR   ${i}   IN RANGE   ${type_del}
            Wait Until Page Contains Element                xpath=//android.view.View[@content-desc="Test_add${i}"]//android.widget.Button             30s
            Tap                                             xpath=//android.view.View[@content-desc="Test_add${i}"]//android.widget.Button
            Wait Until Page Does Not Contain Element        xpath=//android.view.View[@content-desc="Test_add${i}"]
        END
        ${checkbox_count}     Get Matching Xpath Count     xpath=${CheckBox}
    END

