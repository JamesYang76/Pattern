class ApplicationForm
  include ActiveModel::Model

  def persisted?
    false
  end


  def save
    return false unless valid?

    persist!
    true
  end

  def save!
    save.tap do |saved|
      raise ActiveRecord::RecordInvalid unless saved
    end
  end


  private

  def persist!
    raise NotImplementedError, "#persist has to be implemented"
  end
end
