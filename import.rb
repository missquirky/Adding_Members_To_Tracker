require 'csv'    
require 'rubygems'
require 'curb'


csv_text = File.read('$filename')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  email = row[4]
  fullname = row[2] + " " + row[3]
  json = %Q[{"email":"#{email}","name":"#{fullname}","role":"member"}]
  
  http = Curl.post("https://www.pivotaltracker.com/services/v5/projects/$PROJECT_ID/memberships", json) do|http|
    http.headers['X-TrackerToken'] = '$TRACKER_API_TOKEN'
    http.headers['Content-Type'] = 'application/json'
  end
end



