require 'thor'

class SourceFile < Thor
  include Thor::Actions
  source_root 'tmp'

  desc 'fetch source files', 'fetch source files from given zip file'
  def fetch(zip, name)
    fetch_from_path zip
    set_name name
  end

  desc 'move', 'move source files to vendor/assets'
  def move
    self.destination_root = 'vendor/assets'
    copy_file "#{@extract_path}/style.css", "stylesheets/#{@name}/style.css"
    copy_file "#{@extract_path}/lte-ie7.js", "javascripts/#{@name}/lte-ie7.js"
    copy_file "#{@extract_path}/license.txt", "stylesheets/#{@name}/license.txt"
    empty_directory "fonts/#{@name}"
    directory "#{@extract_path}/fonts", "fonts/#{@name}"
  end

  desc 'convert css to sass file', 'convert css to sass file by sass-convert'
  def convert
    self.destination_root = 'vendor/assets'
    inside destination_root do
      run "sass-convert -F css -T sass stylesheets/#{@name}/style.css stylesheets/#{@name}/style.css.sass"
      gsub_file "stylesheets/#{@name}/style.css.sass", "'fonts/", "'#{@name}/"
      gsub_file "stylesheets/#{@name}/style.css.sass", ' url', ' font-url'
    end
  end

  desc 'clean up useless files', 'clean up useless files'
  def cleanup
    self.destination_root = 'vendor/assets'
    remove_file "stylesheets/#{@name}/style.css"
    FileUtils.rm_rf self.class.source_root
  end

  protected

  def set_name(name)
    @name ||= name
  end

  def set_archive_file(filename)
    @archive_file ||= File.join self.class.source_root, filename
  end

  def set_extract_path(path)
    @extract_path ||= path
  end

  def extract(file_path, output_path, pattern)
    system "tar -x -f '#{file_path}' -C '#{output_path}' #{pattern}"
  end

  def fetch_from_path(zip_file_path)
    zip_file_name = File.basename zip_file_path
    pattern = File.basename zip_file_name, '.zip'
    set_archive_file zip_file_name

    in_root do
      say_status '       fetch', zip_file_path, :green
      # FileUtils.mkdir_p self.class.source_root
      copy_file zip_file_path, @archive_file
      if File.exist? @archive_file
        extract @archive_file, self.class.source_root, pattern
        FileUtils.rm_rf @archive_file
      end
    end

    set_extract_path pattern
  end

  def github_download_url
    'https://github.com/Keyamoon/IcoMoon--limited-/zipball/master'
  end

  def github_filename
    'Keyamoon-IcoMoon--limited--master.zip'
  end

  def fetch_from_github
    set_archive_file github_filename

    in_root do
      say_status '       fetch', github_download_url, :green
      get github_download_url, @archive_file
      if File.exist? @archive_file
        extract @archive_file, self.class.source_root, nil
        FileUtils.rm_rf @archive_file
      end
    end

    files = Dir.glob File.join(self.class.source_root, 'Keyamoon-IcoMoon-*')
    pattern = File.basename files.first, '.zip'
    set_extract_path pattern
  end
end
