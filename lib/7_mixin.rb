# You've noticed when you pass around an object, some methods tend to change it's state(instance
# variables). It's called state mutation, and you are eager to minimize room for error.
#
# Idea is to clone an object before passing it to a method that might change it. But implementing
# clone in each class is tedious work, also code would be repeated multiple times which is something
# we always want to avoid.
#
# Implement Cloneable mixin which facilitate capabilities for shallow cloning. Cloneable module
# should provide following methods:
#   `#clone()`
#     - using reflection, determine current objects class and then allocate(Class#allocate) memory
#       space for the new object
#     - proceede with copying each instance variable to allocated object
#
#  `#clone_with(overrides)`
#     - accepts a Hash of overriding attributes
#     - same as clone, but if instance variable is present in overrides, then its value is taken
#       from overrides argument
module Cloneable
end
