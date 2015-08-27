module Admin::UsersHelper
  def get_user_type(arg)
    case arg
      when nil
        '일반'
      when 2
        '특별회원'
      when 3
        '병원회원'
      when 4
        '관리자'
    end
  end
end
