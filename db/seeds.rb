# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


admissions = Department.create(name:'Admissions')
bursars = Department.create(name:'Bursars')
registra = Department.create(name:'Registra')
facility_management =  Department.create(name:'Facility Management')

d = User.create( :email => 'd@b.c', :password => '12341234', :password_confirmation => '12341234', :role => 'student')
e = User.create( :email => 'e@b.c', :password => '12341234', :password_confirmation => '12341234', :role => 'student')
f = User.create( :email => 'f@b.c', :password => '12341234', :password_confirmation => '12341234', :role => 'student')
g = User.create( :email => 'g@b.c', :password => '12341234', :password_confirmation => '12341234', :role => 'student')
a = User.create( :email => 'a@b.c', :password => '12341234', :password_confirmation => '12341234',:department_id => admissions.id, :role => 'faculty')
b = User.create( :email => 'b@b.c', :password => '12341234', :password_confirmation => '12341234',:department_id => admissions.id, :role => 'faculty')
c = User.create( :email => 'c@b.c', :password => '12341234', :password_confirmation => '12341234',:department_id => bursars.id , :role => 'faculty')
h = User.create(email: 'admin@b.c', password: '12341234', :password_confirmation => '12341234', :role => 'admin')


Issue.create(title:'from user d',body:'help me asap',student_id:d.id,dept_id: admissions.id, student_status:'pending',dept_status:'pending',status:'pending')
Issue.create(title:'from user e',body:'help me asap',student_id:e.id,dept_id: admissions.id, student_status:'pending',dept_status:'pending',status:'pending')
Issue.create(title:'from user g',body:'help me asap',student_id:g.id,dept_id: admissions.id, student_status:'pending',dept_status:'pending',status:'pending')
Issue.create(title:'from user f',body:'help me asap',student_id:f.id,dept_id: bursars.id, student_status:'pending',dept_status:'pending',status:'pending')
Issue.create(title:'from user d',body:'help me asap',student_id:d.id,dept_id: bursars.id, student_status:'pending',dept_status:'pending',status:'pending')
