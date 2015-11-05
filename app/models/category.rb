class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category", :foreign_key => "parent_id", :dependent => :destroy
  belongs_to :parent_category, :class_name => "Category", foreign_key: "parent_id"
  has_many :promotions, dependent: :nullify
  
  def depth
    unless @depth
      unless parent_category.nil?
        @depth = parent_category.depth + 1
      else
        @depth = 0
      end
    end
    @depth
  end
end