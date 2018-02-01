class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?

    if sender.valid? && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance >= @amount && @status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if receiver.balance >= @amount && @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
