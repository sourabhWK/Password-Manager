class Credential < ApplicationRecord
  belongs_to :user
  after_destroy :log_destroy_action

  def log_destroy_action
    puts 'Credential destroyed'
  end
end
