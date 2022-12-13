class SubmissionRecord < ApplicationRecord
  validates :content, presence: true
  validates :operation, presence: true
  validates :team_id, presence: true
  validates :user, presence: true
  validates :assignment_id, presence: true

  # Creates a duplicate SubmissionRecord object, associates it to the specified Team
  # and it used while copying calibration submissions.
  def copy_to_another_team(team)
    new_submission_record = dup
    new_submission_record.team_id = team.id
    new_submission_record.assignment_id = team.parent_id
    new_submission_record.save
    new_submission_record
  end
end
