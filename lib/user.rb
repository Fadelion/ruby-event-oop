class User
  attr_accessor :email, :age

  def initialize(email, age)
    # Vérification que l'email et l'age sont valides
    raise ArgumentError, 'Email invalide' unless email =~ /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/
    raise ArgumentError, 'L\'âge doit être un entier positif' unless age.is_a?(Integer) && age.positive?
    # Variable pour référencer tous les utilisateurs créés
    @name = email.split('@').first.capitalize
    @name = @name.split('.').map(&:capitalize).join(' ')
    @name = @name.split('_').map(&:capitalize).join(' ')
    @name = @name.split('-').map(&:capitalize).join(' ')
    @name = @name.split(' ').map(&:capitalize).join(' ')
    @@all_users ||= []
    @email = email
    @age = age
    @@all_users << self
  end

  def self.all
    return @@all_users
  end
  def self.find_by_email(email)
    @@all_users.find { |user| user.email == email }
  end

  def self.find_by_name(name)
    @@all_users.find { |user| user.name == name }
  end

  def self.find_by_age(age)
    @@all_users.find { |user| user.age == age }
  end

  def to_s
    "Nom : #{@name}\n" \
    "Email : #{@email}\n" \
    "Âge : #{@age}"
    
  end
end