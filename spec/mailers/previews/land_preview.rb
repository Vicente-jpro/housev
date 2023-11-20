# Preview all emails at http://localhost:3000/rails/mailers/land
class LandPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/land/publisher
  def publisher
    LandMailer.publisher
  end

end
