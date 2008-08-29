class Section < ActiveRecord::Base
  
  has_many :stories
  
  
  
  def is_tab_check
    if self.is_tab
      "&#10003;" # checkmark HTML entity... TODO: test for support, this might need to be changed
    end
  end
  
  def highlight_tab
    if self == @section # ???? TODO: get this working so I can highlight one link
      'class="activelink"'
    end
  end
end
