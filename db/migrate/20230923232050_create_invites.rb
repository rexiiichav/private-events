class CreateInvites < ActiveRecord::Migration[7.0]
  def change
    create_table :invites do |t|
      t.references :invitee, null: false, foreign_key: { to_table: :users }, index: true
      t.references :invitation, null: false, foreign_key: { to_table: :events }, index: true
      
      t.timestamps
    end
  end
end
