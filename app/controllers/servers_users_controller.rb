class ServersUsersController < ApplicationController
    def new
        @servers_users = ServersUser.new
        @server_id = params[:server_id]
    end

    def create
        users_selected_emails = params[:users]
        affected_server =  Server.find(params[:servers_user][:server_id])

        users_selected_emails.each do |email|
            new_member_assoc = ServersUser.new
            new_member = User.where(email: email).first

            new_member_assoc.user_id = new_member.id
            new_member_assoc.server_id = affected_server.id

            if !new_member_assoc.save
                redirect_to affected_server, notice: "failed adding member"
                return
            end
            
        end

        redirect_to affected_server, notice: "added succesfully"
    end
end
