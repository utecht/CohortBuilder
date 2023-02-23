class Collection < ApplicationRecord
	has_many :patients, dependent: :destroy
	has_many :documents, dependent: :destroy
end
