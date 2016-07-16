module HeadHelper
  def create_headers(headers = {})
    headers.each do |k, v|
      headers.merge!(k => v)
    end
  end
end
