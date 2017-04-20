class SessionsController < ApplicationController
  def new
  end

  def create

      host = 'MSD-INF-SDC-001.msd.govt.state.ma.us'
      port = 636
      ldap = Net::LDAP.new :host => host,
          :port => port,
          :encryption => :simple_tls,
          :auth => {
              :method => :simple,
              :username => params[:session][:username],
              :password => params[:session][:password]
          }
      if ldap.bind
        # log the user in and redirect to the user's show page
        redirect_to root_path
      else
      	render 'new'
      end
  end

  def destroy
  end
end
