module ListHelper
  def self.truncate_name(name)
    if name.length > 11
      name[0..10]
    else
      (11 - name.length).times { name += " " }
      name
    end
  end
end
