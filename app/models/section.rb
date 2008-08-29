class Section < ActiveRecord::Base
  
  has_many :stories
  
  
  
  def is_tab_check
    if self.is_tab
      "&#10003;" # checkmark HTML entity... TODO: test for support, this might need to be changed
    end
  end
  
  def highlight_tab   # NOT WORKING.  once I get this working use <%= section.highlight_tab %> in the view
    # smelly workaround for now: <% if @section == section %> class="activelink" <% end %> 
    # TODO: refactor
    if self == @section 
      'class="activelink"'
    end
  end
end
