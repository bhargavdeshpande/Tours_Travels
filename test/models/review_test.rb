require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "a customer should not be able to create a blank review for a tour" do
    review = Review.new
    assert_not review.save
  end

  test "a customer should be able to create a fully completed review for a tour" do
    review = reviews(:one)
    assert review.save
  end

  test "a customer should not be able to create a review when no customer is specified" do
    review = Review.new
    #review.user = users(:one)
    review.tourname = "Raleigh"
    review.tour = tours(:one)
    review.username= "Nikita"
    review.tourReview= "Beautiful place to live"
    review.subject = "nice place"
    assert_not review.save
  end

  test "a customer should not be able to create a review when no tour is specified" do
    review = Review.new
    review.user = users(:one)
    review.tourname = "Raleigh"
    #review.tour = tours(:one)
    review.username= "Nikita"
    review.tourReview= "Beautiful place to live"
    review.subject = "nice place"
    assert_not review.save
  end

  test "a customer should not be able to create a review when subject is specified" do
    review = Review.new
    review.user = users(:one)
    review.tourname = "Raleigh"
    #review.tour = tours(:one)
    review.username= "Nikita"
    review.tourReview= "Beautiful place to live"
    #review.subject = "nice place"
    assert_not review.save
  end

  test "a customer should not be able to create a review when no tour review is specified" do
    review = Review.new
    review.user = users(:one)
    review.tourname = "Raleigh"
    review.tour = tours(:one)
    review.username= "Nikita"
    #review.tourReview= "Beautiful place to live"
    review.subject = "nice place"
    assert_not review.save
  end

end
