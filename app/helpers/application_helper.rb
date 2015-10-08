module ApplicationHelper
  def is_active_controller(controller_name)
    params[:controller] == controller_name ? "active" : nil
  end

  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def get_region(address)
    address_array = address.split(' ').to_a
    "#{address_array[0]} #{address_array[1]}"
  end

  def datetime_humanize(arg)
    (arg.nil?)? '-' : arg.strftime('%Y-%m-%d')
  end

  def datetimefull_humanize(arg)
    (arg.nil?)? '-' : arg.strftime('%Y-%m-%d %H:%M:%S')
  end

  def get_grade(arg)
    case arg
      when 1
        'A'
      when 2
        'B'
      when 3
        'C'
      else
        '-'
    end
  end

  def get_validate(arg)
    case arg
      when 0
        content_tag(:span, '인증', class: 'label label-primary', )
      when 1
        content_tag(:span, '미인증', class: 'label label-danger', )
      else
        content_tag(:span, '-', class: 'label', )
    end
  end

  def get_status(arg)
    case arg
      when true
        content_tag(:span, 'ON', class: 'label label-primary', )
      when false
        content_tag(:span, 'OFF', class: 'label label-danger')
      else
        content_tag(:span, '-', class: 'label', )
    end
  end

  def humanize_changes_for(changes)

  end

  def humanize_history(audit)
    "#{datetimefull_humanize(audit.updated_at)} 에 #{User.find(audit.user_id).name} 님에 의해서 [#{I18n.t('simple_form.labels.device_ware.spec')}] 항목이 #{audit.audited_changes}로 변경 되었습니다."
  end

  def humanize_version(version_id)
    DeviceWare.find(version_id).version
  end
end
