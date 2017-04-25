class Article < ApplicationRecord
  belongs_to :author
  
  has_many :comments, dependent: :destroy
	validates :title, presence: true, length: { minimum: 5 }
  
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  after_initialize :init
  
  def init
    self.views ||=0
  end
  
  def slug
    slug_line = self.body[0..120].split(' ')
    slug_line = slug_line.slice(0..slug_line.size-2).join(' ')
    return slug_line
  end
  
  def view_counter
    self.views += 1
    self.save
  end
  
  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end
  
  # Takes the string containing tags, formats each comma-seperated tag,
  # places them in an array, assigns each tag to the article
  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect {|name| Tag.find_or_create_by(name: name)}
    self.tags = new_or_found_tags
  end
end
