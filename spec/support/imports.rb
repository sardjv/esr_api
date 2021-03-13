RSpec.configure do |config|
  config.around(:example, type: :job) do |example|
    # Clear imports_directory before tests.
    empty_imports_directory
    example.run
    empty_imports_directory
  end
end

def empty_imports_directory
  imports_directory = 'imports/test'
  Dir.children(imports_directory).each do |dir|
    Dir.children(File.join(imports_directory, dir)).each do |file|
      File.delete(File.join(imports_directory, dir, file))
    end
    Dir.delete(File.join(imports_directory, dir))
  end
end
