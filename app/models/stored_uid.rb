class StoredUid < ActiveRecord::Base
  def self.clean_database
    StoredUid.delete_all(['valid_until < ?', Date.today])
  end
end
