# PaperTrail::Version#reify doesn't seem to parse JSON automatically.
module PaperTrailVersionWithJson
  def reify
    "MODIFIED2 - #{super}"
  end
end

if ENV['WITH_FIX']
  Rails.configuration.to_prepare do
    puts "DEBUG: prepending reify fix for develompent"
    PaperTrail::Version.prepend(PaperTrailVersionWithJson)
  end
else
  PaperTrail::Version.prepend(PaperTrailVersionWithJson)
end
