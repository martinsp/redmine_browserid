class BrowseridController < AccountController
  unloadable

  def login
    if request.post?
      email = validate_assertion(params['browserid_assertion'])
      if email != false
        user = User.find_by_mail(email)
        if user.nil?
          invalid_credentials
        else
          # Valid user
          if user.active?
            successful_authentication(user)
          else
            handle_inactive_user(user)
          end
        end
        return # do not redirect to signin_path, redirect is already handled
      end
    end
    redirect_to signin_path
  end

protected
  def validate_assertion(assertion)
    if (assertion != nil)
      audience = request.host_with_port
      http = Net::HTTP.new('browserid.org', 443)
      http.use_ssl = true
      headers = {
       'Content-Type' => 'application/x-www-form-urlencoded',
      }
      data = "audience="+audience+"&assertion="+assertion

      resp = http.post("/verify",data,headers)
      return false if resp.body.blank?
      begin
        bid_resp = JSON.parse(resp.body)
        return bid_resp['email'] if (bid_resp['status'] == "okay")
      rescue JSON::ParserError
        logger.info "BrowserId returned bad JSON"
      end
    end
    return false
  end
end
