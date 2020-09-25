class Task < ApplicationRecord
  belongs_to :project

  def complete!
    self.status = true
    save
  end
end
