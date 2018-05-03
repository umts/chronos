module FormHelper
  def date_field(object_name, method, options = {})
    content_tag :div, { class: 'input-group date datepicker' } do
      options[:placeholder] = 'YYYY-MM-DD'
      concat text_field(object_name, method, options)
      concat content_tag :span, (
        content_tag :span, nil, { class: 'glyphicon glyphicon-calendar' }
        ), { class: 'input-group-addon' }
    end
  end

  def time_field(object_name, method, options = {})
    content_tag :div, { class: 'input-group date timepicker' } do
      options[:placeholder] = 'HH:MM AM'
      concat text_field(object_name, method, options)
      concat content_tag :span, (
        content_tag :span, nil, { class: 'glyphicon glyphicon-time' }
        ), { class: 'input-group-addon' }
    end
  end

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
