if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'schools').blank?
      user.plugins.create(:name => 'schools',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
