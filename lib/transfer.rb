class Transfer
  # your code here
  attr_accessor :sender, :receiver, :pending, :amount, :status

   def initialize(sender, receiver, amount)
       @sender =  sender
       @receiver = receiver
       @status = "pending"
       @amount = amount
   end
   def valid?
   sender.valid? && receiver.valid?
  
  end

  def execute_transaction

    if valid? && @sender.balance > @amount &&  @status == "pending"
        receiver.balance += amount
        sender.balance  -= amount
        @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

    def reverse_transfer
      if valid? && @sender.balance > @amount &&  @status == "complete"
        receiver.balance -= amount
        sender.balance  += amount
        @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end


    end

end
