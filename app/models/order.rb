class Order < ApplicationRecord
  include AASM

  attr_reader :nonce
  belongs_to :user
  has_many :order_items

  before_create :create_order_num



  aasm column: 'status' do # default column: aasm_state
    state :unprocessed, initial: true
    state :paid, :delivered, :cancelled

    event :pay do
      transitions from: :unprocessed, to: :paid
      after_transaction do
        puts "-----------------"
        puts "send SNS"
        puts "-----------------"
      end
    end

    event :deliver do
      transitions from: :paid, to: :delivered
    end
    event :cancel do
      transitions from: [:unprocessed, :paid], to: :cancelled
    end
  end

  private

  def create_order_num
    self.order_num = num_generator
  end

  def num_generator
    year = Date.today.year
    month = Date.today.month
    day = Date.today.day
    code = [*0..9, *'A'..'Z'].sample(6).join
    today = "#{year}#{"%02d" % month}#{"%02d" % day}#{code}"

    return today
  end


end
