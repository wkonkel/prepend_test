# PaperTrail::Version#reify doesn't seem to parse JSON automatically.
module PaperTrailVersionWithJson
  def reify
    puts "DEBUG: modified reify!"
    super
  end
end

if Rails.env.production?
  puts "DEBUG: prepending reify fix for production"
  PaperTrail::Version.prepend(PaperTrailVersionWithJson)
else
  # wrap this in #to_prepare so that it works in dev after we reload!
  Rails.configuration.to_prepare do
    puts "DEBUG: prepending reify fix for develompent"
    PaperTrail::Version.prepend(PaperTrailVersionWithJson)
  end
end
