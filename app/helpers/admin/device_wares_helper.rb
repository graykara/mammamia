module Admin::DeviceWaresHelper
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
end
