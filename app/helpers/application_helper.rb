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
end
