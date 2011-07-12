require 'rake'
require 'erb'

desc "simple test task"
task :simple do
  INSTALL_FROM = File.expand_path(File.dirname(__FILE__))
  @file = "some_file_name.erb.html.whackadoo"
  puts_file
end

desc "install the dot files into user's home directory"
task :install do
  install_from = File.expand_path(File.dirname(__FILE__))
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README.rdoc LICENSE].include? file

    @file = File.join(install_from, file)
    @wo_erb = @file.sub(/\.erb$/, '')
    @link = File.join(ENV['HOME'], ".#{@wo_erb}")
    if File.exist?(@link)
      if File.identical?(@file, @link)
        puts "identical - #{@file} and #{@link}"
      elsif replace_all
        replace_file
      else
        print "backup and replace #{@link}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file
        when 'y'
          replace_file
        when 'q'
          exit
        else
          puts "skipping #{@link}"
        end
      end
    else
      link_file
    end
  end

  @file, @link = File.join(install_from,'localized'), File.join(ENV['HOME'], 'localized')
  system %Q{git clone git@github.com:stepchud/localized.git}
  link_file
  puts "For localized environment, go to ~/.dotfiles/localized and checkout the branch corresponding to your environment."
  puts "Installation complete."
end

def replace_file
  system %Q{mv "#{@link}" "#{@link}.backup_#{Time.now.to_s.split[0,2].join('@')}}
  link_file
end

def link_file
  if File.extname(@file) == '.erb'
    puts "generating ~/.#{@wo_erb} from erb"
    File.open(@link, 'w') do |new_file|
      new_file.write ERB.new(File.read(@file)).result(binding)
    end
  else
    puts "linking #{@link} to #{@file}"
    system %Q{ln -s "#{@file}" "#{@link}"}
  end
end

def puts_file
  puts "your file is #{File.join(INSTALL_FROM, @file)}"
end
