module UsersHelper
  def user_type_badge(user)
    if user.is_ldap?
      content_tag(:span, "OHSU LDAP", class: "badge rounded-pill text-bg-info")
    else
      content_tag(:span, "Local Admin", class: "badge rounded-pill text-bg-secondary")
    end
  end
end
