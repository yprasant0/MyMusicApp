VCR.configure do |c|
  #the directory where cassettes will be saved
  c.cassette_library_dir = 'spec/vcr'
  # HTTP request service.
  c.hook_into :webmock
end
