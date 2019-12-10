# gem install pycall
#https://stackoverflow.com/questions/18645352/call-python-script-from-ruby
require 'pry'
require 'pycall'

#esult = exec("test_python.py")
#system 'test_python.py'
system 'python', *["test_python.py", params1, params2]
#result = 'test_python.py params'

binding.pry


