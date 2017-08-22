class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.new_room_added.subject
  #
	  def new_room_added(room)
	    @room = room
	    admin = Role.find_by('name = ?', "admin")
	    user = User.find_by('role_id = ?', admin.id)
	    mail to: "#{user.email}", subject: "New room has been added - #{room.name}"
	  end

	  def room_authorized(room)
	    @room = room
	    mail to: "#{room.user.email}", subject: "Your room has been authorized  - #{room.name}"
	  end
end