1. กลุ่ม Happy Path (กรณีใช้งานปกติ - ตรวจสอบความถูกต้อง)
กลุ่มนี้เป็นการทดสอบว่าเมื่อส่งข้อมูลที่ถูกต้องแล้ว API ต้องทำงานได้ตามสเปก

Test Case 1.1: Verification of Health Check Endpoint
API: GET /health-check
Input / Payload: ไม่มี
Expected Result: Status Code: 200 OK
Response Body: แสดงสถานะว่าระบบพร้อมใช้งาน (เช่น "success": true)
Response Time: ควรเร็วเป็นพิเศษ (เช่น ต่ำกว่า 200ms)

Test Case 1.2: Create a New Note Successfully
API: POST /notes
Input / Payload: * Headers: Authorization: Bearer <valid_token>, Content-Type: application/json
Body: ข้อมูลโน้ตที่ครบถ้วน (เช่น {"title": "Meeting", "description": "Discuss project updates"})
Expected Result:Status Code: 201 Created
Response Body: มีการคืนค่า id ของโน้ตที่ถูกสร้างใหม่ และข้อมูลตรงกับที่ส่งไป

2. กลุ่ม Negative Path (กรณีส่งข้อมูลผิดพลาด - ตรวจสอบ Error Handling)
กลุ่มนี้สำคัญมาก เพื่อดูว่าระบบป้องกันตัวเองและแจ้งเตือนผู้ใช้ (หรือนักพัฒนา) ได้ดีแค่ไหน เมื่อเจอกรณีใส่ข้อมูลผิด

Test Case 2.1: Missing Required Fields
API: POST /notes
Input / Payload: ข้อมูลไม่ครบตามที่ระบุใน Docs (เช่น ส่งแต่ description แต่ไม่ส่ง title)
Expected Result: Status Code: 400 Bad Request
Response Body: มีข้อความเตือนชัดเจน เช่น "message": "Title is required"

Test Case 2.2: Data Validation (String Length / Type)
API: POST /note
Input / Payload: ส่งค่า title ยาวเกินกว่าระบบกำหนด (เช่น เกิน 100 ตัวอักษร) หรือส่งประเภทข้อมูลผิด (เช่น ส่งตัวเลขไปในฟิลด์ที่เป็นข้อความ)
Expected Result: Status Code: 400 Bad Request หรือ 422 Unprocessable Entity

3. กลุ่ม Security & Authentication (ความปลอดภัย)
Test Case 3.1: Access Without Token (Unauthorized)
API: GET /notes (หรือ Endpoint ใดๆ ที่ต้องล็อกอิน)
Input / Payload: ไม่ใส่ Authorization ใน Header
Expected Result: Status Code: 401 Unauthorized

Test Case 3.2: Accessing Other User's Data (Broken Object Level Authorization)
API: GET /notes/{note_id}
Input / Payload: ใช้ Token ของ User A แต่พยายามเรียกดู note_id ที่เป็นของ User B
Expected Result: Status Code: 403 Forbidden หรือ 404 Not Found (เพื่อไม่ให้แฮกเกอร์รู้ว่ามี ID นี้อยู่จริง)

4. กลุ่ม Boundary & CRUD Lifecycle (ความต่อเนื่องทางธุรกิจ)
Test Case 4.1: End-to-End CRUD Flow
เป็นการทดสอบต่อสัญญากรรม (Flow-based):
Create: สร้างโน้ตใหม่ (POST) -> เก็บ id ไว้
Read: ดึงข้อมูลโน้ตตัวนั้นมาดู (GET /notes/{id}) -> เช็กว่าข้อมูลตรงไหม
Update: แก้ไขเนื้อหา (PUT/PATCH /notes/{id}) -> เช็กว่าอัปเดตจริงไหม
Delete: ลบโน้ตนั้นออก (DELETE /notes/{id}) -> เช็กว่าได้ 200 หรือ 204
Read Again: ดึงข้อมูลโน้ตตัวเดิมซ้ำ -> ต้องได้ 404 Not Foun