class Person
    attr_reader :name
    attr_accessor :bank_account, :happiness, :hygiene
  
    MAX_HAPPINESS = 10
    MIN_HAPPINESS = 0
    MAX_HYGIENE = 10
    MIN_HYGIENE = 0
  
    def initialize(name)
      @name = name
      @bank_account = 25
      @happiness = 8
      @hygiene = 8
    end
  
    def happiness=(new_happiness)
      @happiness = if new_happiness > MAX_HAPPINESS
                     MAX_HAPPINESS
                   elsif new_happiness < MIN_HAPPINESS
                     MIN_HAPPINESS
                   else
                     new_happiness
                   end
    end
  
    def hygiene=(new_hygiene)
      @hygiene = if new_hygiene > MAX_HYGIENE
                   MAX_HYGIENE
                 elsif new_hygiene < MIN_HYGIENE
                   MIN_HYGIENE
                 else
                   new_hygiene
                 end
    end
  
    def happy?
      happiness > 7
    end
  
    def clean?
      hygiene > 7
    end
  
    def get_paid(amount)
      self.bank_account += amount
      'all about the benjamins'
    end
  
    def take_bath
      self.hygiene += 4
      '♪ Rub-a-dub just relaxing in the tub ♫'
    end
  
    def work_out
      self.hygiene -= 3
      self.hygiene = MIN_HYGIENE if hygiene.negative?
  
      self.happiness += 2
      self.happiness = MAX_HAPPINESS if happiness > MAX_HAPPINESS
  
      '♪ another one bites the dust ♫'
    end
  
    def call_friend(friend)
      self.happiness += 3
      friend.happiness += 3
  
      self.happiness = MAX_HAPPINESS if happiness > MAX_HAPPINESS
      friend.happiness = MAX_HAPPINESS if friend.happiness > MAX_HAPPINESS
  
      "Hi #{friend.name}! It's #{name}. How are you?"
    end
  
    def start_conversation(person, topic)
      case topic
      when 'politics'
        self.happiness -= 2
        person.happiness -= 2
  
        self.happiness = MIN_HAPPINESS if happiness.negative?
        person.happiness = MIN_HAPPINESS if person.happiness.negative?
  
        'blah blah partisan blah lobbyist'
      when 'weather'
        self.happiness += 1
        person.happiness += 1
  
        self.happiness = MAX_HAPPINESS if happiness > MAX_HAPPINESS
        person.happiness = MAX_HAPPINESS if person.happiness > MAX_HAPPINESS
  
        'blah blah sun blah rain'
      else
        'blah blah blah blah blah'
      end
    end
  end
  