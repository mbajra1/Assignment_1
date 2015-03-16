#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :get_date_time

  def get_date_time

    time = Time.now
    time.strftime('%Y-%m-%d %H:%M:%S')

  end

  def set_cookies

    cookies[:the_time] = Time.now

  end


  helper_method :get_last_visit

  def get_last_visit

    last_visit = cookies[:the_time]
    cookies[:expires]= 120.days.from_now
    last_visit_time = Time.strptime(last_visit,'%Y-%m-%d %H:%M:%S')
    current_time = Time.now
    time_diff = (current_time - last_visit_time)/86400

    if time_diff > 120
      render(:text => "Your last visited was too long ago.")
    else
      render(:text => "The last time you visited was #{last_visit}")
    end

  end

end
