class Dog

  include Mongoid::Document
  include Mongoid::Timestamps 
  field :name
  field :breed
  field :sex
  field :slug
  key :name, :slug

  mount_uploader :image, ImageUploader

#  :inclusion => { :in => [1,2,3] }
  attr_accessible :name, :breed, :sex,:image
  referenced_in :user, :inverse_of => :user
#    embedded_in :user , :inverse_of => :dogs

  before_validation :set_slug

  def set_slug
    self.slug = rand(36**8).to_s(36) if self.slug.nil?
  end

end
