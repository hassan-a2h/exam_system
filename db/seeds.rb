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

# exam1 = Exam.new(title: 'Social Test', teacher_id: 2, subject_id: 1)
# Mcq.create(question: 'Capital of Pakistan?',
#                   option1: 'Islamabad',
#                   option2: 'Karachi',
#                   option3: 'Quetta',
#                   option4: 'Lahore',
#                   correct_option: 1,
#                   marks: 2,
#                   exam_id: 1)
# Mcq.create(question: 'Land area of Pakistan (square kilometers)',
#                     option1: '1,219,100',
#                     option2: '500,000',
#                     option3: '796,000',
#                     option4: '50,000',
#                     correct_option: 3,
#                     marks: 2,
#                     exam_id: 1)
# Blank.create(text_before: 'There are',
#                     answer: '5',
#                     text_after: 'rivers in Pakistan',
#                     marks: 2,
#                     exam_id: 1)
# Blank.create(text_before: 'Pakistan can into being in year',
#                     answer: '1947',
#                     marks: 2,
#                     exam_id: 1)
# exam1.save!
