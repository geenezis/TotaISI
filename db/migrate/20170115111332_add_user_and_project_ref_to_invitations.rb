class AddUserAndProjectRefToInvitations < ActiveRecord::Migration[5.0]
  def change
    add_reference :invitations, :user, foreign_key: true
    add_reference :invitations, :project, foreign_key: true
  end
end
