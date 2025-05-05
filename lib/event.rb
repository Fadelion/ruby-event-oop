require 'time'
class Event
  attr_accessor :start_date, :duration, :title, :attendees
  def initialize(start_date, duration, title, attendees)
    # Initialisation des variables d'instances
    @start_date = start_date
    @duration = duration
    @title = title
    @attendees = attendees
    # Vérfier si la date est écrit en chaîne de caractères sous la forme yyyy-mm-dd hh:mm
    if @start_date.is_a?(String)
      unless @start_date.match(/\A\d{4}-\d{2}-\d{2} \d{2}:\d{2}\z/)
        raise ArgumentError, 'La date doit être au format yyyy-mm-dd hh:mm'
      end
      @start_date = DateTime.parse(@start_date)
    end
    # Parse de la date de début
    #start_date = DateTime.parse(start_date.to_s) if start_date.is_a?(String)
    # Vérification que la date de début est valide
    #raise ArgumentError, 'La date de début doit être un objet DateTime' unless @start_date.is_a?(DateTime)
    # Vérification que la durée est valide
    raise ArgumentError, 'La durée doit être un entier positif' unless duration.is_a?(Integer) && @duration.positive?
    # Vérification que le titre est valide
    raise ArgumentError, 'Le titre doit être une chaîne de caractères' unless @title.is_a?(String) && !@title.empty?
    # Vérification que les participants sont valides
    raise ArgumentError, 'Les participants doivent être un tableau de chaînes de caractères' unless @attendees.is_a?(Array) && @attendees.all? { |attendee| attendee.is_a?(String) && !attendee.empty? && attendee =~ /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/ }

  end

  # méthode pour décaler l'évènement de 24 heures
  def postpone_24h
    @start_date += 1
    return @start_date
  end 

  # méthode pour calculer la date de fin de l'évènement
  def end_date
    @start_date + (@duration * 60)
  end

  # méthode pour vérifier si l'évènement est passé
  def is_past?
    @start_date < DateTime.now
  end

  # méthode pour vérifier si l'évènement est à venir
  def is_future?
    @start_date > DateTime.now
  end

   # Méthode pour vérifier si l'évènement commence dans 30 minutes
  def is_soon?
    time_difference = (@start_date - DateTime.now) * 24 * 60
    # Evènement dans 30 mns ?
    time_difference <= 30 && time_difference >= 0
  end

  # méthode pour afficher les informations de l'évènement
  def to_s
    "Titre : #{@title}\n" \
    "Date de début : #{@start_date.strftime('%d/%m/%Y %H:%M')}\n" \
    "Durée : #{@duration} minutes\n" \
    "Participants : #{@attendees.join(', ')}"
  end

end