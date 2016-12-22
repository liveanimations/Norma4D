require 'zip'

class ZipFileGenerator
  def initialize(files, zip_archive)
    @files = files
    @zip_archive = zip_archive
  end

  def write
    ::Zip::File.open(@zip_archive, ::Zip::File::CREATE) do |io|
      @files.each_with_index do |entry, index|
        put_into_archive(entry, io, index)
      end
    end
  end

  private

  def put_into_archive(disk_file_path, io, index)
    io.get_output_stream(file_name(disk_file_path, index)) do |f|
      f.write(File.open(disk_file_path, 'rb').read)
    end
  end

  def file_name(path, index)
    file_name = path.match(/[\w-]+\./)[0]
    file_name.delete('.') + "_#{index}" + '.pdf'
  end
end
