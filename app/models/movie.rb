class Movie < ActiveRecord::Base
	has_many :shows
	has_many :actors
	has_attached_file :poster, styles: {standard: "600x900#", large:"1000x1500#", small: "500x750#", xsmall: "100x150#"}, :default_url => '/images/missing_:style.jpg'
	validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/
	accepts_nested_attributes_for :actors, reject_if: proc {|attributes| attributes["name"].blank?}, allow_destroy: true
	accepts_nested_attributes_for :shows, :reject_if => proc { |attributes| attributes.any? {|k, v| v.blank?} }, allow_destroy: true
end
