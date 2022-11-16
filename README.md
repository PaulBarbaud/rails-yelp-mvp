# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# Un restaurant doit avoir un nom, une adresse et une catégorie.
validates :name, presence: true
validates :address, presence: true

validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

 has_many :reviews, dependent: :destroy

# Un avis doit avoir un contenu.
belongs_to :restaurant
validates :content, presence: true

# Un avis doit avoir une note.
validates :rating, presence: true

# La note d’un avis doit être un nombre entre 0 et 5.
validates :rating, inclusion:  { in: (0..5) }

# La note d’un avis doit être un entier. Par exemple, un avis avec une note de 2,5 doit être invalide !
 validates :rating, numericality: { only_integer: true }
