require 'rake'
require 'erb'

IGNORE_FILES = %w{Rakefile README.rdoc LICENSE localized}
APPEND_FILES = %w{bashrc}

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
  backup_all = false
  Dir['*'].each do |file|
    next if IGNORE_FILES.include? file

    @file = File.join(install_from, file)
    @wo_erb = file.sub(/\.erb$/, '')
    @link = File.join(ENV['HOME'], ".#{@wo_erb}")

    if APPEND_FILES.include? file
      append_file
    elsif File.exist?(@link)
      if File.identical?(@file, @link)
        puts "identical - #{@file} and #{@link}"
      elsif replace_all
        replace_file
      else
        print "backup(b), backup all(B), replace(r), replace all(R), no(n), quit(q): #{@link}? [bBrRnq] "
        case STDIN.gets.chomp
        when 'b'
          backup_file
        when 'B'
          backup_all = true
          backup_file
        when 'r'
          replace_file
        when 'R'
          replace_all = true
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
  if File.exist?(@file)
    puts "'localized' dir exists! can't get the repo."
  else
    `pushd #{install_from} && git clone git://github.com/stepchud/localized.git && popd`
    link_file unless File.exist?(@link)
  end

  puts "Installation complete."
  puts "Now you can cd to #{@file} and checkout the branch corresponding to your machine env."
end

def backup_file
  `mv "#{@link}" "#{@link}.backup_#{Time.now.to_s.split[0,2].join('@')}"`
  link_file
end

def replace_file
  `rm -rf "#{@link}"`
  link_file
end

def link_file
  if File.extname(@file) == '.erb'
    puts "generating #{@link} from erb"
    File.open(@link, 'w') do |new_file|
      new_file.write ERB.new(File.read(@file)).result(binding)
    end
  else
    puts "linking #{@link} to #{@file}"
    `ln -s "#{@file}" "#{@link}"`
  end
end

def append_file
  File.open(@link, 'a') do |app_file|
    app_file.puts "\n# dotfiles additions"
    app_file.write File.read(@file)
  end
end

def puts_file
  puts "your file is #{File.join(INSTALL_FROM, @file)}"
end
