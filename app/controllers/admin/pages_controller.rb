class Admin::PagesController < AdminsController
  def home
  end

  def blank
      @student = Student.new
  end
end
