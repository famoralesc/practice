# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  REGULAR_PRICE = 15
  DISCOUNTED_PRICE = 10
  MIN_AGE_FOR_DISCOUNT = 60
  MIN_AGE_FOR_SCARY_MOVIES = 18

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age < MIN_AGE_FOR_DISCOUNT ? REGULAR_PRICE : DISCOUNTED_PRICE
  end

  def watch_scary_movie?
    @age < MIN_AGE_FOR_SCARY_MOVIES ? false : true
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    @member ? "🍿": (raise NotMovieClubMemberError)
  end
end
