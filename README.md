# Online Exam System

This app provide a simple way to evaluate students on a specific subject. Teacher can create exams, post exams with start and end time. Teachers can also
views performance of students for a specific exam. Students can attempt any exam that is active and view the result as soon as the exam the over.
The admin can invite students and teachers, and can also views statistics of exams. Additionally, admin can create subjects and assign teachers to subjects.

# Different User roles in Application

1) Admin
2) Teacher
3) Student

# Gems Used

* Devise, for authentication
* Pundit, for authorization
* Bootstrap, for styling
* rubocop-rails, for enforcing styles
* jquery-rails, helper for bootstrap
* devise_invitable, for invitations
* cocoon, for nested forms
* dot-env, for storing sensitive information

# Setup required

* Populate .env file with gmail credentials
* Setup mailer using gmail for sending invitation mails
* require jquery in Application.js to send delete requests
* Amazon S3 is used for online storage, setup its credentials as well
