# Preview all emails at http://localhost:3000/rails/mailers/house
class HousePreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/house/publisher
  def publisher
    HouseMailer.publisher
  end

end
