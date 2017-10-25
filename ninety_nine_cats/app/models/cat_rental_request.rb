class CatRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: ['PENDING', 'APPROVED', 'DENIED']
  validate :does_not_overlap_approved_request

  belongs_to :cat,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    CatRentalRequest.where(
      "(start_date > ? AND start_date < ?)
      OR (end_date > ? AND end_date < ?)",
      self.start_date, self.end_date,
      self.start_date, self.end_date)
      .where.not(id: self.id)
      .where(cat_id: self.cat_id)
  end

  def overlapping_approved_requests
    overlapping_requests.where(status: 'APPROVED')
  end

  def does_not_overlap_approved_request
    if overlapping_approved_requests.exists?
      errors.add("Request overlaps with existing approved requests")
    end
  end

  def overlapping_pending_requests
    overlapping_requests.where(status: 'PENDING')
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = 'APPROVED'
      self.save
      overlapping_pending_requests.each(&:deny!)
    end
  end

  def deny!
    CatRentalRequest.transaction do
      self.status = 'DENIED'
      self.save
    end
  end

  def pending?
    return true if self.status == 'PENDING'
    false
  end
end
