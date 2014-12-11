class AddConfidentialFlagToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :confidential, :boolean, default:false
  end
end
