namespace :dev do
  desc "TODO"
  task setup: :environment do
  puts "Cadastrando contatos..."
    50.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 60.years.ago, to: 18.years.ago)
        
      )
    end
  p "Contatos cadastrados com sucesso!"
    
  end
end
