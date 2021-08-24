class OrderMailer < ApplicationMailer
  def new_order_email
    @order = params[:order]

    mail(to: 'okbloomerteam@gmail.com', subject: "Welcome!")
  end
end
