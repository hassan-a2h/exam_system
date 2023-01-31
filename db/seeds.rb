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

Exam.create(title: 'Quiz Lecture 1-5', status: 2, teacher_id: 2, subject_id: 1)
Mcq.create(exam_id: 1, question: 'Year of Independence for Pakistan',
                       option1: '1857', option2: '1900', option3: '1920',
                       option4: '1947', marks: 2, correct_option: 4)
Mcq.create(exam_id: 1, question: 'Number of rivers in Pakistan',
                        option1: '3', option2: '4', option3: '5',
                        option4: '6', marks: 1, correct_option: 3)
Mcq.create(exam_id: 1, question: 'Population of Pakistan',
                          option1: '20 Million', option2: '400 Million', option3: '1 Billion',
                          option4: '220 Million', marks: 2, correct_option: 4)
Mcq.create(exam_id: 1, question: 'Biggest province of Pakistan (Land Area)',
                            option1: 'Balochistan', option2: 'Punjab', option3: 'KPK',
                            option4: 'Sindh', marks: 1, correct_option: 3)
Blank.create(exam_id: 1, text_before: 'Bangladesh came to existence in the year', answer: '1971', marks: 2)
Blank.create(exam_id: 1, text_after: 'is the name of Founder of Pakistan', answer: 'Muhammad Ali Jinnah', marks: 2)

Exam.create(title: 'Commerce 101', status: 2, teacher_id: 2, subject_id: 2)
Mcq.create(exam_id: 2, question: 'Are wealth and value corelated?',
                       option1: 'Yes', option2: 'No', option3: 'Maybe',
                       option4: 'None', marks: 2, correct_option: 1)
Mcq.create(exam_id: 2, question: 'What causes value of currency to decrease over time',
                        option1: 'interest', option2: 'investment', option3: 'inflation',
                        option4: 'None', marks: 2, correct_option: 3)
Mcq.create(exam_id: 2, question: 'How are exchange rates of currencies determined?',
                          option1: 'Differnce between purchasing power', option2: 'Geographic factor',
                          option3: 'Military Power',
                          option4: 'Arbirary factors', marks: 2, correct_option: 1)
Mcq.create(exam_id: 2, question: 'Why does value of dollar value increase?',
                            option1: 'Dollar has contant value', option2: 'Petro-dollar agreement',
                            option3: 'Strong economy of US',
                            option4: 'None', marks: 2, correct_option: 2)
Blank.create(exam_id: 2, text_after: 'cause value of currency to always drop', answer: 'inflation', marks: 2)
Blank.create(exam_id: 2, text_before: 'National currency of Pakistan is', answer: 'rupee', marks: 2)
