require "rubygems"
require "aws-sdk"
load './local_env.rb' if File.exist?('./local_env.rb')
def connect_to_bucket(win_name)
    
   Aws::S3::Client.new(
     # access_key_id:ENV['AWS_ACCESS_KEY_ID']
     # secret_access_key:ENV['AWS_SECRET_ACCESS_KEY']
     # region:ENV['AWS_REGION'] 
   )
   #id = "Tordffei" + "/n"
     file = 'game_log.csv'
     write_file = File.open(file, "a") #"a" stands for "append" and adds to the csv file
     write_file << win_name    #adds value of id to the file
     write_file.close
     bucket = 'csv-isbn'
     s3 = Aws::S3::Resource.new(region: 'us-east-2')
     obj = s3.bucket(bucket).object(file) #connects to bucket
     File.open(file, 'rb') do |file|
   obj.put(body: file) #pushes new values into file & bucket
   end
end