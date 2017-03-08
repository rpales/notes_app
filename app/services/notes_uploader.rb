require 'fog'

class NotesUploader
  def self.create user_id
    csv = self.csv_file(user_id)

    file = self.s3_connection.directories.new(:key => ENV['S3_BUCKET']).files.new({
      :key    => "notes/#{user_id}/notes.csv",
      :body   => csv.open,
      :public => false,
      :expires => 1.day,
      :content_type => 'text/csv',
      :content_disposition => "attachment; filename=#{user_id}_#{(Time.now.to_f*1000).to_i}.csv"
    })

    file.save
    csv.close
    file
  end

  def self.csv_file user_id
    user = User.find(user_id)
    return if user.nil?

    csv_temp = Tempfile.new("temp_#{user_id}")

    File.open(csv_temp, 'w') do |csv|
      csv.puts "title, content, created_at, updated_at"
      user.notes.each do |note|
        csv.puts "#{note.title},#{note.content},#{note.created_at},#{note.updated_at}"
      end
    end

    csv_temp
  end

  def self.s3_connection
    Fog::Storage.new({
      :provider                 => 'AWS',
      :aws_access_key_id        => ENV['AWS_ACCESS_KEY'],
      :aws_secret_access_key    => ENV['AWS_SECRET_KEY'],
      :region                   => ENV['AWS_REGION'],
    })
  end
end
