require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  fixtures :sections
  

  
  def test_all_sections
    # sections exist
    all_sections 
    assert_response :success
  end      

  def test_current_section
    assert_valid(current_section)
  end
  
  def test_current_section_name
    # is this one even worth doing?  I suppose maybe
    assert_equal current_section.name current_section_name    
  end
  
  # def test_tab_style(tab_section)  
  #   assert true
  # end
  
  
end        
