# frozen_string_literal: true

Admin.create(name: 'Waqar Ahmad', email: 'hassana2hx@gmail.com', password: '12345678',
             password_confirmation: '12345678')
Teacher.create(name: 'Ahmad Raza', email: 'rizwan@gmail.com', password: '12345678',
               password_confirmation: '12345678')
Teacher.create(name: 'Imran Babar', email: 'babar@gmail.com', password: '12345678',
               password_confirmation: '12345678')
Student.create(name: 'Akbar Ali', email: 'akbar@gmail.com', password: '12345678',
               password_confirmation: '12345678')
Student.create(name: 'Talha Nadeem', email: 'talha@gmail.com', password: '12345678',
               password_confirmation: '12345678')

Subject.create(name: 'Social Studies', admin_id: 1, teacher_id: 2)
Subject.create(name: 'E-commerce', admin_id: 1, teacher_id: 2)
Subject.create(name: 'Fundamentals of Computing', admin_id: 1, teacher_id: 3)
Subject.create(name: 'Intro to Algorithms', admin_id: 1, teacher_id: 3)
