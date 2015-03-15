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

    cookies[:the_time] = Time.now.to_s;
    # cookies[:the_name] = { :value => "Web", :expires => 120.days.from_now :path => "/cookies"}

  end

  def get_last_visit
    if cookies[:the_name] == nil?
      cookie_value = cookies[:the_time]
      render(:text => "The last time you visited was #{cookie_value}")
    else
      render(:text => "Your last visited was too long ago.")
    end
  end
end
