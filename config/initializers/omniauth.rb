Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, "1719689884970334", "1e46bbd69f4cdd9ca411135b0c1e76a4"

  provider :google_oauth2, "1002156009921-qn1v5pfa4po7f7rjg2est9171rfmrv64.apps.googleusercontent.com", "s9ILx2xqjpItzkTOXdMORy-O", { skip_jwt: true }

end
