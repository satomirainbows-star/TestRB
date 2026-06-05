*** Settings ***
Documentation     API Automation Testing Suite - Complete End-to-End
Library           RequestsLibrary
Resource          ../Keywords/API_keywords.robot
Resource          ../Resources/API_variables.robot

# สั่งให้สร้าง Session ครั้งเดียวตอนเริ่มการทดสอบทั้งหมด
Suite Setup       Initialize API Session

*** Test Cases ***

TC 01: Verify Health Check Endpoint (Happy Path)
    [Documentation]    ตรวจสอบว่าระบบ API พร้อมใช้งานภาพรวมหรือไม่ (GET /health-check)
    Verify Health Check Endpoint
    Log To Console      \nHealth Check Passed!

TC 02: Verify Access Without Token Returns Unauthorized (Negative Path)
    [Documentation]    ตรวจสอบความปลอดภัยพื้นฐาน หากไม่ส่ง Token ต้องโดนปฏิเสธ (401 Unauthorized)
    Verify Unauthorized Access On Notes
    Log To Console      \nUnauthorized Check Passed!

TC 03: User Management Lifecycle and Password Security Flow
    [Documentation]    Flow: สมัครสมาชิก -> ล็อกอิน -> เช็กโปรไฟล์ -> เปลี่ยนรหัสผ่าน -> ล็อกเอาต์
    Register New User Account    ${USER_NAME}    ${USER_EMAIL}    ${USER_PASSWORD}  
    ${auth_headers}=     Login And Get Auth Headers    password=${USER_PASSWORD}  
    ${profile}=          Get User Profile Information    ${auth_headers}
    Should Be Equal As Strings    ${profile['email']}    ${USER_EMAIL}    ignore_case=${TRUE}
    Update User Profile Information    ${auth_headers}    Robot Verified Name
    Change User Password    ${auth_headers}    ${USER_PASSWORD}    ${NEW_PASSWORD}
    Logout User          ${auth_headers}
    Log To Console       \n[PASS] User Management Flow Completed!

TC 04: Complete Notes CRUD and Lifecycle Management
    [Documentation]    Flow: ล็อกอิน(รหัสใหม่) -> สร้างโน้ต -> ตรวจสอบ -> ลบโน้ต
    # ลบ Account เสมอ ไม่ว่าเคสนี้จะรันผ่านหรือพังก็ตาม!
    [Teardown]           Run Keyword And Ignore Error    Delete User Account    ${auth_headers}
    # ล็อกอินด้วยรหัสผ่านชุดล่าสุด (NEW_PASSWORD)
    ${auth_headers}=     Login And Get Auth Headers    password=${NEW_PASSWORD}   
    # วงจรของ Notes
    ${note_id}=          Create A New Note    ${auth_headers}    ${NOTE_TITLE}    ${NOTE_DESC}    ${NOTE_CATEGORY}
    ${all_notes}=        Get All Notes    ${auth_headers}
    Verify Note Content By ID    ${auth_headers}    ${note_id}    ${NOTE_TITLE}
    Delete Note By ID    ${auth_headers}    ${note_id}
    Log To Console       \n[PASS] Notes CRUD Flow Completed!