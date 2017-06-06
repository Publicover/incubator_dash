class Homework < ApplicationRecord
  belongs_to :student
  belongs_to :assignment
  has_attached_file :document, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :document,
    content_type: [
      "image/jpeg",
      "application/pdf",
      "file/txt",
      "text/plain",
      "application/doc",
      "application/docx",
      "application/msword",
      "application/vnd.ms-excel",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "application/vnd.ms-powerpoint"
    ],
    message: "invalid attached file type"
  # after_save :set_name

  # def set_name
  #   self.update title: document_file_name.sub(/\.[^.]+\z/, '').titleize
  # end
end
