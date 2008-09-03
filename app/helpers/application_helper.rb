module ApplicationHelper
  

  ##### Stories #####
  def breaking_story
    @breaking_story  ||= Story.find(:first, 
                                    :conditions => ['is_breaking = ? and published = ?', true, true], 
                                    :order => 'publish_at DESC')
  end

  def breaking_story_title
    breaking_story.title
  end
  
  def selection_intro(section)
    @selection ||= Story.find(:first,
                              :conditions => ['section = ?', section],
                              :order => 'publish_at DESC')
    # @selection.intro
  end
  
  
  ##### Sections & Tabs #####
  def all_sections
    @all_sections ||= Section.find(:all)
  end

  def current_section
    # there's got to be a better way to do this... TODO: fix this when I change the routing
    unless params[:id].nil?
      @current_section ||= Section.find(params[:id])
    end
  end

  def current_section_name
    current_section.name
  end

  def tab_style(tab_section)
    if current_section == tab_section
      ' class="activelink"'  # NOTE: the space is there for a reason
    end
  end


  ##### Users #####
  def current_user
    # for someday when I implement users
    @current_user ||= User.find(session[:user_id])
  end


  ##### Date Helpers #####
  def month_abbrev(date)
    Date::ABBR_MONTHNAMES[date.month]      
  end
  def month_name(date)
    Date::MONTHNAMES[date.month]
  end
  # I used to have this in the view:  Date::MONTHNAMES[@story.display_date.month]  8^p
  # TODO: next refactoring: add these to class Date, so I can just use @story.display_date.month_name



  ###############################################
  protected
  
  def admin?
    # this will do temporarily... obviously not robust enough for production...
    request.remote_ip == "127.0.0.1"
  end
  
  def authorize
    unless admin?
      flash[:error] = "unauthorized access"
      redirect_to home_page
      false
    end
  end
  
  
end
