#!/usr/bin/ruby

# load up and initialize Wirble with some nice defaults
begin
  require 'rubygems'
  require 'wirble'
  require 'interactive_editor'
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    return Object.instance_methods.sort if obj.instance_of?(Object) rescue nil
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    system 'ri', method.to_s
  end
end

def copy(str)
  IO.popen('pbcopy', 'w') { |f| f << str.to_s }
end

def copy_history
  history = Readline::HISTORY.entries
  index = history.rindex("exit") || -1
  content = history[(index+1)..-2].join("\n")
  puts content
  copy content
end

def paste
  `pbpaste`
end

def enable_trace( event_regex = /^(call|return)/, class_regex = /IRB|Wirble|RubyLex|RubyToken|ActiveSupport|ActionController/ )
  puts "Enabling method tracing with event regex #{event_regex.inspect} and class exclusion regex #{class_regex.inspect}"

  set_trace_func(Proc.new{|event, file, line, id, binding, classname| printf "[%8s] %30s %30s (%s:%-2d)\n", event, id, classname, file, line if event =~ event_regex && classname.to_s !~ class_regex})
end

def disable_trace
  puts "Disabling method tracing"

  set_trace_func nil
end

load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
