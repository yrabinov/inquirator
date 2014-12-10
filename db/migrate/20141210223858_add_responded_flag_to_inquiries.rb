class AddRespondedFlagToInquiries < ActiveRecord::Migration
  def change
    add_column :inquiries, :responded, :boolean, default:false
  end
end
