# input 'ruby' or '<3 ruby'
class One
  (1..30).each { |i| [10, 20, 25].include?(i) ? puts('ruby') : puts('<3 ruby') }
end
