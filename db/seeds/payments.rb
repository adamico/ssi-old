if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'payments').blank?
      user.plugins.create(:name => 'payments',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
