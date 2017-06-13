class AddQueryIdToSearch < ActiveRecord::Migration[5.1]
  def change
    add_reference :searches, :query, foreign_key: true
    remove_column :searches, :term, :string
  end
end
