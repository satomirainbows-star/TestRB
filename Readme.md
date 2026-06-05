# Robot Framework API Testing

Automated API Testing project utilizing **Robot Framework**. This repository is designed with a clean, Keyword-Driven architecture to ensure scalability and maintainability for software testing workflows.

## 📂 Project Structure

โครงสร้างของโปรเจกต์ถูกแบ่งสัดส่วนอย่างชัดเจน เพื่อแยก Test Cases, Keywords, Variables และ Reports ออกจากกันตามมาตรฐาน:

```text
Project - Robotframework/
│
├── tests/                  # เก็บไฟล์ Test Cases สำหรับรันการทดสอบหลัก
│   └── register_test.robot
│
├── keywords/               # เก็บไฟล์ Keywords (Functions) ที่ถูกเรียกใช้ซ้ำ
│   └── register_keywords.robot
│
├── resources/              # เก็บไฟล์ Variables, ข้อมูลจำลอง และการตั้งค่าต่างๆ
│   └── variables.robot
│
└── reports/                # โฟลเดอร์สำหรับเก็บไฟล์ผลลัพธ์ (log.html, report.html)



# 1. สร้างระบบ Git ในโฟลเดอร์นี้ (หากเคยทำแล้ว ข้ามบรรทัดนี้ได้เลยครับ)
git init

# 2. เชื่อมต่อโปรเจกต์ในเครื่อง เข้ากับ GitHub ของคุณ
git remote add origin https://github.com/satomirainbows-star/TestRB.git

# 3. บันทึกการเปลี่ยนแปลงของไฟล์ทั้งหมด (รวมถึงโฟลเดอร์ .github ที่เพิ่งสร้าง)
git add .

# 4. สร้างข้อความกำกับ (Commit Message) ว่าเราทำอะไรลงไป
git commit -m "Add Robot Framework API test cases and CI workflow"

# 5. ดันโค้ดขึ้น GitHub (ถ้ากิ่งหลักของคุณชื่อ master ให้เปลี่ยนคำว่า main เป็น master ครับ)
git push -u origin main


# หลังจากแก้ไขไฟล์
git add .
git commit -m "Fix case-sensitive folder name in CI"
git push

git add .
git commit -m "Fix Modify File Test Case "
git push