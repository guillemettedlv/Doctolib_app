# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Doctor.destroy_all
Patient.destroy_all
City.destroy_all

cities = Array.new
doctors = Array.new
patients = Array.new

10.times do
  city = City.create!(
    name: Faker::Address.city
    )
    cities << city
end

30.times do
  doctor = Doctor.create!(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  specialty: Faker::Job.field,
  zip_code: Faker::Address.zip_code,
  city: cities.sample
  ) 
  patient = Patient.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: cities.sample
  )
  doctors << doctor
  patients << patient
end

30.times do
  appointment = Appointment.create!(
    doctor: doctors.sample,
    patient: patients.sample,
    date: Faker::Date.in_date_period,
    city: cities.sample
  ) 
end