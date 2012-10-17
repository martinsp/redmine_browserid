module RedmineBrowserid
  class ViewHookListener < Redmine::Hook::ViewListener
    render_on :view_account_login_bottom, :partial => "browserid/login"
  end
end