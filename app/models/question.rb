class Question < ActiveRecord::Base
  CATEGORIES = ["short_answer","fill_in_the_blank","multiple_choice"]
  belongs_to :question_queue
  
  validates :position, presence: true, on: :update
  around_create :set_default_position
  
  def responses_field
    responses.join("\n")
  end
  
  def responses_field=(value)
    self.responses = value.split("\n")
  end
  
  private def set_default_position
    if position.blank?
      question_queue.questions.update_all("position=position+1")
      write_attribute(:position,0)
    end
    yield
  end
end
