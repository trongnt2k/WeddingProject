# WeddingProject
1. Clone project
2. Cài MySQL và import data từ file sql trong project, tên schema phải đặt là weddingdb
3. Cài môi trường venv:
  - Mở Pycharm Community Edition
  - Chọn File -> Settings -> Project: WeddingProject -> Python Interpreter -> Bấm chọn biểu tượng bánh răng -> Add -> OK
4. Activate venv:
  - Cửa sổ terminal đường dẫn ngay vị trí project:
    + Gõ lệnh cd venv/Scripts -> Enter
    + Gõ lệnh activate -> Enter
    + Gõ cd ../.. để trở về đường dẫn project 
5. Cài các thư viện:
  - Gõ lệnh pip install -r requirements.txt
6. Thực thi các migrate: 
  - Gõ lệnh pip install migrate
7. Chạy project: 
  - Gõ lệnh python manage.py runserver
8.  Truy cập vào http://localhost:8000/ hoặc http://localhost:8000/swagger để sử dụng các APIs
9.  Các trang thống kê của admin: http://localhost:8000/admin/wedding-month-stats
