class Glossary < ActiveRecord::Base

	scope :by_language, -> (lang) { where( language: lang) }

	ALPHABET = ('a'..'z').to_a
end
