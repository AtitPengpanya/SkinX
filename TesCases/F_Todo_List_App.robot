*** Settings ***
Resource        ..//init.txt
Test Teardown   Close Application
*** Test Cases ***
TC_Todo_List_App_001
    [Documentation]
    ...     *** Test Step ***
    ...    Set Config Open Application
    ...    Verfy Display Element
    ...    Tap Input Text
    ...    Tap CheckBox And Delete 
    ...     *** Test Description ***
    ...     input list app 1
    ...     Verify list app input
    ...     Delete list app 1    
    ...     Verify Delete app 
    Open Application Android
    Verfy Display Element
    Tap Input Text      
    Tap CheckBox And Delete 

TC_Todo_List_App_002
    [Documentation]
    ...     *** Test Step ***
    ...    Set Config Open Application
    ...    Verfy Display Element
    ...    Tap Input Text
    ...    Tap CheckBox And Delete 
    ...     *** Test Description ***
    ...     input list app 5
    ...     Verify list app input
    ...     Delete list app 2    
    ...     Verify Delete app and count list app 3
    Open Application Android
    Verfy Display Element
    Tap Input Text              5
    Tap CheckBox And Delete     2

TC_Todo_List_App_003
    [Documentation]
    ...     *** Test Step ***
    ...    Set Config Open Application
    ...    Verfy Display Element
    ...    Tap Input Text
    ...    Tap CheckBox And Delete 
    ...     *** Test Description ***
    ...     input list app 10
    ...     Verify list app input
    ...     Delete list app All   
    ...     Verify Delete app
    Open Application Android
    Verfy Display Element
    Tap Input Text      8
    Tap CheckBox And Delete   ALL 

#วิธีการรัน test
#1 robot -t "TC_Todo_List_App_001" .\TesCases\F_Todo_List_App.robot
#2 robot -t "TC_Todo_List_App_002" .\TesCases\F_Todo_List_App.robot
#3 robot -t "TC_Todo_List_App_003" .\TesCases\F_Todo_List_App.robot
# 1-3 : robot .\TesCases\F_Todo_List_App.robot