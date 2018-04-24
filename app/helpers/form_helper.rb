module FormHelper
  def datetime_field(object_name, method, options = {})
    content_tag :div, { class: 'input-group date datetimepicker' } do
      options[:placeholder] = 'mm/dd/yyyy hh:mm p'
      concat text_field(object_name, method, options)
      concat content_tag :span, (
        content_tag :span, nil, { class: 'glyphicon glyphicon-calendar' }
        ), { class: 'input-group-addon' }
    end
  end
end
