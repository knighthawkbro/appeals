class SessionsController < ApplicationController
  # Form for login
  def new; end

  # Logging into a new Sessions
  def create
    connection = { host: 'MSD-INF-SDC-001.msd.govt.state.ma.us',
                   port: 636, encryption: :simple_tls, auth: {
                     method: :simple, username: params[:session][:username],
                     password: params[:session][:password] } }
    ldap = Net::LDAP.new connection
    if ldap.bind
      # log the user in and redirect to the user's show page
      redirect_to root_path
    else
      render 'new'
    end
  end

  # Logging out of a session
  def destroy; end
end
