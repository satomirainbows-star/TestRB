*** Settings ***
Library           RequestsLibrary
Library           Collections
Resource          ../Resources/API_variables.robot
*** Keywords ***
Initialize API Session
    Create Session    api_session    ${BASE_URL}    verify=True



Verify Health Check Endpoint
    [Documentation]    ตรวจสอบสถานะการทำงานของระบบ (GET /health-check)
    ${response}=         GET On Session    api_session    /health-check
    Status Should Be     200    ${response}

Verify Unauthorized Access On Notes
    [Documentation]    ตรวจสอบการเข้าถึง API โน้ตโดยไม่ใส่ Token (ต้องได้ 401)
    # ใส่ expected_status=401 เพื่อบอกโรบอตว่า "ฉันคาดหวังให้มัน Error นะ ไม่ต้องตกใจ"
    ${response}=         GET On Session    api_session    /notes    expected_status=401
    Status Should Be     401    ${response}

Register New User Account
    [Arguments]          ${name}    ${email}    ${password}
    &{payload}=          Create Dictionary    name=${name}    email=${email}    password=${password}
    ${response}=         POST On Session    api_session    /users/register    json=${payload}
    Status Should Be     201    ${response}

Login And Get Auth Headers
    [Arguments]          ${email}=${USER_EMAIL}    ${password}=${USER_PASSWORD}
    &{login_headers}=    Create Dictionary    Content-Type=application/json
    &{login_payload}=    Create Dictionary    email=${email}    password=${password}
    ${login_resp}=       POST On Session    api_session    /users/login    json=${login_payload}    headers=${login_headers}
    Status Should Be     200    ${login_resp}
    ${token}=            Set Variable    ${login_resp.json()['data']['token']}
    &{headers}=          Create Dictionary    x-auth-token=${token}    Content-Type=application/json
    RETURN               ${headers}

Get User Profile Information
    [Arguments]          ${headers}
    ${response}=         GET On Session    api_session    /users/profile    headers=${headers}
    Status Should Be     200    ${response}
    RETURN               ${response.json()['data']}

Update User Profile Information
    [Arguments]          ${headers}    ${new_name}
    &{payload}=          Create Dictionary    name=${new_name}
    ${response}=         PATCH On Session    api_session    /users/profile    json=${payload}    headers=${headers}
    Status Should Be     200    ${response}

Change User Password
    [Arguments]          ${headers}    ${current_password}    ${new_password}
    &{payload}=          Create Dictionary    currentPassword=${current_password}    newPassword=${new_password}
    ${response}=         POST On Session    api_session    /users/change-password    json=${payload}    headers=${headers}
    Status Should Be     200    ${response}

Logout User
    [Arguments]          ${headers}
    ${response}=         DELETE On Session    api_session    /users/logout    headers=${headers}
    Status Should Be     200    ${response}

Create A New Note
    [Arguments]          ${headers}    ${title}    ${desc}    ${category}
    &{note_payload}=     Create Dictionary    title=${title}    description=${desc}    category=${category}
    ${create_resp}=      POST On Session    api_session    /notes    json=${note_payload}    headers=${headers}
    # 🔥 ดัก Status เป็น 200 ตามที่เซิร์ฟเวอร์ตอบกลับมาจริง
    Status Should Be     200    ${create_resp}    
    ${note_id}=          Set Variable    ${create_resp.json()['data']['id']}
    RETURN               ${note_id}

Get All Notes
    [Arguments]          ${headers}
    ${response}=         GET On Session    api_session    /notes    headers=${headers}
    Status Should Be     200    ${response}
    RETURN               ${response.json()['data']}

Verify Note Content By ID
    [Arguments]          ${headers}    ${note_id}    ${expected_title}
    ${get_resp}=         GET On Session    api_session    /notes/${note_id}    headers=${headers}
    Status Should Be     200    ${get_resp}
    Should Be Equal As Strings    ${get_resp.json()['data']['title']}    ${expected_title}

Delete Note By ID
    [Arguments]          ${headers}    ${note_id}
    ${delete_resp}=      DELETE On Session    api_session    /notes/${note_id}    headers=${headers}
    Status Should Be     200    ${delete_resp}

Delete User Account
    [Arguments]          ${headers}
    ${response}=         DELETE On Session    api_session    /users/delete-account    headers=${headers}
    Status Should Be     200    ${response}