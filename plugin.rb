# frozen_string_literal: true

# name: shadow-inherit-groups
# about: Make shadow users inherit their parent users' groups.
# version: 0.1
# authors: Alan Liang
# url: https://github.com/acm-21/discourse-shadow-inherit-groups.git

PLUGIN_NAME ||= 'ShadowInheritGroups'

after_initialize do
  class ::AnonymousShadowCreator
    module OverridingAnonymousShadowCreator
      def create_shadow!    
        shadow = super()      
        shadow.groups = user.groups      
        shadow.reload      
        shadow
      end  
    end  
    prepend OverridingAnonymousShadowCreator
  end  
end
