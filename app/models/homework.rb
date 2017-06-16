class Homework < ApplicationRecord
  belongs_to :student
  belongs_to :assignment
  validates :title, :student_id, :assignment_id, presence: true
  has_attached_file :document
  validates_attachment_content_type :document,
    content_type: [
      "image/jpeg",
      "application/pdf",
      "text/plain",
      "application/zip",
      "application/vnd.ms-excel"
    ],
    message: "invalid attached file type"
  # after_save :set_name

  # def set_name
    # self.update(title: "document_one")
  # end
end
