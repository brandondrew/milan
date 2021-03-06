class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.xml
  def index
    @sections = Section.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.xml
  def show
    @sections = Section.find(:all)
    params[:section_id] ||= params[:id]  # kludgey workaround: for some reason :section_id is getting lost and its value put into :id:
    @section = Section.find(params[:section_id])
    @breaking_story  ||= Story.find(:first, 
                                    :conditions => ['is_breaking = ? and published = ?', true, true], 
                                    :order => 'publish_at DESC')




    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.xml
  def new
    @sections = Section.find(:all)  # TODO: refactor so I don't have to repeat this all over the place
    @section = Section.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @sections = Section.find(:all)
    @section = Section.find(params[:section_id])
  end

  # POST /sections
  # POST /sections.xml
  def create
    @sections = Section.find(:all)
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        flash[:notice] = 'Section was successfully created.'
        format.html { redirect_to(@section) }
        format.xml  { render :xml => @section, :status => :created, :location => @section }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sections/1
  # PUT /sections/1.xml
  def update
    @sections = Section.find(:all)
    @section = Section.find(params[:section_id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        flash[:notice] = 'Section was successfully updated.'
        format.html { redirect_to(@section) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.xml
  def destroy
    @sections = Section.find(:all)
    @section = Section.find(params[:section_id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(sections_url) }
      format.xml  { head :ok }
    end
  end
end
