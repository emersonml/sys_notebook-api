class AddKindToContact < ActiveRecord::Migration[6.1]
  def change  ## rails g migration add_kind_to_contact kind:references 
    add_reference :contacts, :kind, null: true, foreign_key: true ##obs foi necessario setar null: true  para o db:migrate funcionar
  end
end
