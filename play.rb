class Hangman

  def initialize
    @word = words.sample
    @lives = 3
    @word_teaser = ''
    @word.first.size.times do
      @word_teaser += "_ "
    end
  end

  def words
    [
      ["matthaus", "played for  Borussia Mönchengladbach, Bayern Munich and Inter"],
      ["vanbasten", "played for Ajax and Milan"],
      ["baggio", "played for Fiorentina, Juventus, Milan, Bologna and Inter"],
      ["weah", "played for Monaco, PSG, Milan, Marseille and Manchester City"],
      ["ronaldo", "played for Cruzeiro, PSV, Barcelona, Inter and Real Madrid"],
      ["zidane", "played for Cannes, Bordeaux, Juventus and Real Madrid"],
      ["rivaldo", "played for Palmeiras, Barcelona, Deportivo La Coruna, Olympiacos and Milan"],
      ["figo", "played for Sporting, Barcelona, Real Madrid, Inter"],
      ["ronaldinho", "played for Gremio, PSG, Barcelona, Milan and Flamengo"],
      ["cannavaro", "played for Napoli, Parma, Inter, Juventus and Real Madrid"],
      ["kaka", "played for Milan, Real Madrid, Sao Paulo and Orlando City"],
      ["cristiano", "played for Sporting, Manchester United, Real Madrid and Juventus"],
      ["messi", "played for Newell's Old Boys and Barcelona"],
      ["lewandowski", "played for Lech Poznan, Dortmund and Bayern Munich"],
      ["modric", "played for Dinamo Zagreb, Tottenham and Real Madrid"],
    ]
  end

  def linebreaker
    puts "----------------------------------------------------------"
  end

  def space
    puts ""
  end

  def print_teaser last_guess = nil
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser last_guess
    new_teaser = @word_teaser.split

    new_teaser.each_with_index do |letter, index|
      # replace blank values with guessed letter if matches letter in word
      if letter == '_' && @word.first[index] == last_guess
        new_teaser[index] = last_guess
      end
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      space
      puts "Enter a letter"
      guess = gets.chomp

      good_guess = @word.first.include? guess

      if guess == "exit"
        space
        linebreaker
        puts "Thanks and see you again!"
        puts "type 'ruby play.rb' to rock again"
        space
      elsif good_guess
        linebreaker
        space
        puts "All right baby, doing good!"
        space
        print_teaser guess
        space

        if @word.first == @word_teaser.split.join
          linebreaker
          puts "Congratulations... you have won this round! It was #{ @word.first } for sure"
          puts "type 'ruby play.rb' to rock again"
          space
        else
          make_guess
        end
      else
        @lives -= 1
        space
        linebreaker
        space
        puts "Sorry... you have #{ @lives } lives left. Try again!"
        space
        make_guess
      end
    else
      linebreaker
      puts "Game over... better luck next time!"
      puts "type 'ruby play.rb' to try again"
      space
    end
  end

  def begin
    linebreaker
    space
    puts "Welcome to CLI hangman text game about FIFA Player of the Year winners"
    space
    puts "To exit game at any point type 'exit'"
    space
    linebreaker
    puts "Let's get going... your player last name is #{ @word.first.size } characters long."
    puts "Little tip from me: #{ @word.last }."
    linebreaker
    space
    print_teaser
    space
    space
    make_guess
  end

end

game = Hangman.new
game.begin