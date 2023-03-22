class AddStatusToInquiries < ActiveRecord::Migration[7.0]
  def change
    add_column :inquiries, :status, :boolean, :default => false
  end
end
