namespace :dev do
  desc "TODO"
  task setup: :environment do
    puts "Apagando criando e migrando o db..."
    # %x(rails db:drop db:create db:migrate)

#########################
    puts "Cadastrando os tipos de contatos..."
    kinds = %w(Amigo Comercial Conhecido)  ## %w é um atalho para nao precisar ficar usando aspas

    kinds.each do |i|
      Kind.create!(
        description: i
      )
    end 
    p "Tipos de contatos cadastrados com sucesso!"
#########################
    puts "Cadastrando contatos..."
    50.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(from: 60.years.ago, to: 18.years.ago),
        kind: Kind.all.sample
      )
    end
    p "Contatos cadastrados com sucesso!"
#########################
    puts "Cadastrando telefones..."
    Contact.all.each do |i_contact|
      rand(3).times do |j|
        v_phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        i_contact.phones << v_phone  
        i_contact.save!   # !!! foi necessário usar o .save pq o phone nao tem CONTROLLER estnao nao tem create salvou por aqui mesmo.
      end 
    end
    p "telefones cadastrados com sucesso!"
#########################
    puts "Cadastrando endereços..."
    Contact.all.each do |i_contact|
        Address.create!(street: Faker::Address.street_address, city: Faker::Address.city, contact: i_contact )
        # i_contact.address << v_address  
        # i_contact.save!   
    end
    p "Endereços cadastrados com sucesso!"
 #########################
  end
end

## rails db:drop db:create db:migrate dev:setup
