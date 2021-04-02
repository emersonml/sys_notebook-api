class CreateKinds < ActiveRecord::Migration[6.1]
  
  def change  ## feito com   rails g scaffold kind description:string
    create_table :kinds do |t|
      t.string :description

      t.timestamps
    end
  end
end
