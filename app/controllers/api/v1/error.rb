module Api::V1::Error

  class ApiException < Exception
    def code() 403 end
  end

  class Unauthorized < ApiException
    def code() 401 end
  end

end