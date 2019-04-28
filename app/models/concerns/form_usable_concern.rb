# potentially ViewModel/decorator pattern would be cleaner looking but with this scale of application - it's still
# readable enough
module FormUsableConcern
  extend ActiveSupport::Concern
  # this is used in views (yes, it kinda mixes up the logic but in this case what to
  # display really depends on model and application is not that long) in form generation, additional attributes to be
  # used in field_type, eg. step, list of available options etc
  def extra_fields_in_form
    []
  end

  # makes most sense as default as in theory it can handle any value
  def field_type_in_form
    'text_field'
  end
end